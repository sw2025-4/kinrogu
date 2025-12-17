Rails.application.routes.draw do

  # マップ
  get 'maps/index'
  resources :maps, only: [:index]

  get "top/main"
  post "top/login"
  get "top/logout"
  
  resources :users
  #root "users#index"

  get "reviews/index"
  
  resources :users, only: [:index, :new, :create, :destroy]

  # ログイン・ログアウト
  get 'top/main', to: 'top#main'
  post 'top/login', to: 'top#login'
  get 'top/logout', to: 'top#logout'


  # レビュー関連
  resources :reviews, only: [:index, :new, :create]

  # トップページをログイン画面にする場合
  root "top#main" 
  
  # ※ 既存の restaurants などの設定はそのまま残してくださ
  #resources :restaurants
  resources :reviews do
    resource :bookmark, only: [:create, :destroy]
  end
  
  get "bookmarks", to: "bookmarks#index"

  # トップページ
 # root "reviews#index"

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end
