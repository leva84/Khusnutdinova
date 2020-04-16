Rails.application.routes.draw do
  get 'welcome/index'

  resources :trainings

  root 'welcome#index'
end
