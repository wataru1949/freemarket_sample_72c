Rails.application.routes.draw do
  # 以下は今後使用予定のためコメントアウトしている
  # root "buys#new"
  root "users#show"
  # 以下は今後使用予定のためコメントアウトしている
  # root "items#index"
  resources :items do
    resources :buy, only: [:new]
  end
end
