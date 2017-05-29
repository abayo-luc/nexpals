Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'posts#index'
  resources :posts
  get 'tags/:tag', to: 'posts#index', as: "tag"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :comments

  resources :replies

  get "/admin", to: 'sessions#new'
  post "/admin", to: 'sessions#create'
  delete "/admin_out", to: 'sessions#destroy'
  resources :admins, only: [:index, :show, :edit, :update]

  resources :questions
  resources :news_letters do 
    member do 
      get :confirm_email
    end
  end
end
