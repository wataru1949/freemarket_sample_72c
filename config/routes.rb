Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root "items#index"
  resources :users, only: [:show] do
    get 'card', on: :member
    get 'logout', on: :member
  end
  resources :items do
    resources :buys, only: [:new]
  end

  
end
