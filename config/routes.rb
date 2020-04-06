Rails.application.routes.draw do
  # root "users#logout"
  # 以下は今後使用予定のためコメントアウトしている
  root "users#card"
  # root "buys#new"
  # root "users#show"
  # root "items#index"
  resources :items do
    resources :buy, only: [:new]
  end
end
