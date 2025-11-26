Rails.application.routes.draw do
  get "top/main"
  post "top/login"
  get "top/logout"
  
  resources :users
 #root "users#index"


  get "reviews/index"

  get "reviews/index"
  # ユーザー登録 (UsersController)
  resources :users, only: [:index, :new, :create, :destroy]

  # ログイン・ログアウト (TopController)
  get 'top/main', to: 'top#main'
  post 'top/login', to: 'top#login'
  get 'top/logout', to: 'top#logout'

  # トップページをログイン画面にする場合
  
  
  # ※ 既存の restaurants などの設定はそのまま残してくださ
  #resources :restaurants

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'reviews/new', to: 'reviews#new'
  root "reviews#index"
  post 'reviews', to: 'reviews#create'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
