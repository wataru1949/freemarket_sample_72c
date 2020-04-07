Rails.application.routes.draw do
  root "items#index"
  resources :users, only: [:show] do
    get 'card', on: :member
    get 'logout', on: :member
  end
  resources :items do
    resources :buys, only: [:new]
  end
end
