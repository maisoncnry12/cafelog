Rails.application.routes.draw do

  devise_for :users
  get '/' => 'homes#top'
  get 'home/about' => 'homes#about'

  resources :users, only: [:show, :edit, :update]do
    # フォロー/フォロワー
  resource :relationships,only: [:create, :destroy]
  end

  resources :posts,except: [:show]do
    resources :favorites, only: [:index, :create, :destroy]
    resource :comments, only: [:create, :destroy]
  end

  get "/search"=>"searchs#search"

end