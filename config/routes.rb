Rails.application.routes.draw do
  get 'postsusers/show'

  root 'cities#index'

  resources :cities do
    resources :posts
  end

  resources :users do
    resources :posts
  end

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"
end
