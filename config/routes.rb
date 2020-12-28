Rails.application.routes.draw do
  root to: 'stores#index'
  get 'index',  to: 'areas#index'
  get 'search', to: 'stores#search'
  devise_for :users
end
