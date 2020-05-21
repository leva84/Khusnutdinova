Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'welcome#index'
  get 'welcome/index'

  resources :users
  resources :alignments
  resources :playing_cards
  resources :games, only: [:index]
  resource :game

  resources :trainings do
    resources :comments
    resources :descriptions
    resources :training_subscriptions, only: %i[create destroy]
  end
end
