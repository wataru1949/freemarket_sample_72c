Rails.application.routes.draw do
  root "items#index"
  resources :user, only: [:show]
  resources :items do
    resources :buy, only: [:new]
  end
end
