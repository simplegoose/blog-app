Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "articles#index"
  # Defines the root path route ("/")

  root "users#index", as: "users_home"

  resources :users, only: [:show] do
    resources :posts, only: [:new, :create]
    resources :likes, only: [:create]
    resources :comments, only: [:create]
  end

  get "users/:user_id/posts", to: "posts#index"
  get "users/:user_id/posts/:post_id", to: "posts#show", as: "posts_show"

  get "users/:user_id/posts/:post_id/comment/new", to: "comments#new" #new

end
