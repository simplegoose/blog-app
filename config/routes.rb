Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "articles#index"
  # Defines the root path route ("/")

  root "users#index"
  resources :users, only: [:show]
  get "users/:user_id/posts", to: "users#posts"
  get "users/:user_id/posts/:post_id", to: "users#show_post_by_id"
end
