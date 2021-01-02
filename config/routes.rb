Rails.application.routes.draw do
  root 'stores#index'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    get  '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'index',  to: 'areas#index'
  get 'search', to: 'stores#search'
  resources :stores, only: [:search, :show]
  get 'woms/new'
  get 'woms/create'
  get 'woms/edit'
  get 'woms/update'
  get 'woms/destroy'
end
