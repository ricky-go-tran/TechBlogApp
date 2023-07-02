Rails.application.routes.draw do
  root "articles#index"
  resources :articles
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
end
