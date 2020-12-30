Rails.application.routes.draw do
  root 'stores#index'
  get 'index',  to: 'areas#index'
  get 'search', to: 'stores#search'
  resources :stores, only: [:search, :show]
  devise_for :users
end
