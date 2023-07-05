Rails.application.routes.draw do
  root 'articles#index'
  resources :articles
  devise_for :users
  get 'authors', to: 'users#author'
  get 'authors/:id', to: 'users#article_by_author'
end
