Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'welcome#index'
  get 'welcome/index'

  resources :users
  resources :alignments
  resource :game, only: [:create, :show, :update, :destroy]

  resources :trainings do
    resources :comments
    resources :descriptions
  end
end
