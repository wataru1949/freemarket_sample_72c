Rails.application.routes.draw do
  root "items#index"
  resources :users, only: [:show] do
    get 'card', on: :member
    get 'logout', on: :member
  end
  resources :items do
    resources :buy, only: [:new]
  end
end
