Rails.application.routes.draw do

  devise_for :users
  get '/' => 'homes#top'
  get '/about' => 'homes#about'

  resources :users, only: [:show, :edit, :update]do
    # フォロー/フォロワー
   resource :relationships,only: [:create, :destroy]
  # get 'followings' => 'relationships#followings', as: 'followings'
  # get 'followers' => 'relationships#followers', as: 'followers'
  # いいね一覧へのルーティング
   member do
    get :favorites
   end
  end

  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    get "/ranking"=>"ranking#index"
  end

  
  get "/search"=>"searchs#search"

end