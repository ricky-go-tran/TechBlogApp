Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    collection do
      get :manage
    end
  end
  devise_for :users
  get 'authors', to: 'users#author'
  get 'authors/:id', to: 'users#article_by_author'
  get 'manager', to: 'users#account_manage'
  # get 'manager/article', to: 'articles#manage'
end
