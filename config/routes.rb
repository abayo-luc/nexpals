Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :comments

  resources :replies

  get "/admin", to: 'sessions#new'
  post "/admin", to: 'sessions#create'
  delete "/admin_out", to: 'sessions#destroy'
  resources :admins, only: [:index, :show, :edit, :update]

  resources :questions
end
