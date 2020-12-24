Rails.application.routes.draw do
  get 'areas/index'
  root to: 'stores#index'
  get 'search', to: 'stores#search'
  devise_for :users
  # root "homes#index"
end
