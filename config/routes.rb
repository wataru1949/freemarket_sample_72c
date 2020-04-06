Rails.application.routes.draw do
  root "items#index"
  resources :users, only: [:show]
  resources :items do
    resources :buys, only: [:new]
  end
end
