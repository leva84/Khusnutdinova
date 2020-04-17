Rails.application.routes.draw do
  get 'welcome/index'

  resources :trainings do
    resources :comments
  end

  root 'welcome#index'
end
