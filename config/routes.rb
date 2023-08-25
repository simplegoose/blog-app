Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "articles#index"
  # Defines the root path route ("/")

  root "users#index", as: "users_home"
  resources :users, only: [:show]
  get "users/:user_id/posts", to: "posts#index"
  get "users/:user_id/posts/:post_id", to: "posts#show", as: "posts_show"
  get "post/new", to: "posts#new", as: "new_post" # new
  post "post/create", to: "posts#create", as: "post_create" #create
  post "like/create", to: "likes#create", as: "like_create" #create
end
