Rails.application.routes.draw do
  root to: 'stores#index'
  get 'search', to: 'stores#search'
  devise_for :users
  # root "homes#index"
end
