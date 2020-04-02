Rails.application.routes.draw do
  root "buys#new"
  # root "items#index"
  resources :items do
    resources :buy, only: [:new]
  end
end
