Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :comments

  resources :replies
  resources :admins, only: [:index, :show, :edit, :update]
end
