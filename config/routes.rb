Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/comments/new", to:'comments#new'
  post "/comments/new", to:'comments#create'
end
