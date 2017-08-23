Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/posts_with_button', to: 'posts#index_with_button', as: 'posts_with_button'
  
  root 'pages#home'
  get '/home' => "pages#home"
  get '/aboutus' => "pages#aboutus"
  get '/contactus' => "pages#contactus"
  get '/testmonies' => 'testimonies#index'
  get '/members' => 'members#index'
  get '/projects' => "projects#index"
  get '/services'  => 'services#index'




  get '/final' => "pages#final"




  resources :posts
  get 'tags/:tag', to: 'posts#index', as: "tag"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :comments
  resources :posts
  resources :replies
  resources :members

  # get "/in_admin", to: 'sessions#new'
  # post "/in_admin", to: 'sessions#create'
  # delete "/out_admin", to: 'sessions#destroy'
  # resources :admins, only: [:index, :show, :edit, :update]

  resources :questions
  post "/question_reply", to: 'questions#reply'

  resources :news_letters do 
    member do 
      get :confirm_email
    end
  end
  resources :faqs
end
