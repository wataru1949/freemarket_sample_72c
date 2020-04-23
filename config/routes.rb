Rails.application.routes.draw do

  root "items#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :users, only: [:show] do
    get 'card', on: :member
    get 'logout', on: :member
  end
  resources :items do
    resources :buys, only: [:new, :create] do
      collection do
        get 'done', to: 'buys#done'
      end
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    # 編集画面でのカテゴリー表示
    member do
      get 'get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  # バリデーション後のカテゴリー取得
  get 'get_category_children', to: 'items#get_category_children'
  get 'get_category_grandchildren', to: 'items#get_category_grandchildren'

  resources :cards, only: [:index, :new, :create, :destroy]

end
