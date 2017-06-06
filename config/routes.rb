Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'pages#home'
  get '/home' => "pages#home"
  get '/aboutus' => "pages#aboutus"
  get '/contactus' => "pages#contactus"
  get '/testmonies' => 'pages#testmonies'
  get '/members' => 'members#index'
  get '/projects' => "projects#index"
  get '/services'  => 'services#index'
  resources :posts
  get 'tags/:tag', to: 'posts#index', as: "tag"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :comments
  resources :posts
  resources :replies

  get "/admin", to: 'sessions#new'
  post "/admin", to: 'sessions#create'
  delete "/admin_out", to: 'sessions#destroy'
  resources :admins, only: [:index, :show, :edit, :update]

  resources :questions
  post "/question_reply", to: 'questions#reply'

  resources :news_letters do 
    member do 
      get :confirm_email
    end
  end
  resources :faqs
  resources :members
end
