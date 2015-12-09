Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end

  get "/posts/:id/like" => "posts#like_post", :as => :like_post
  get "/posts/:id/dislike" => "posts#dislike_post", :as => :dislike_post
  root 'posts#index'
end
