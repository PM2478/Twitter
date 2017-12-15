Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :posts
  # Define Root URL
  root 'pages#index'
  
  # Define Routes for Pages
  get '/home' => 'pages#home' # override default routes.
  get '/user/:id' => 'pages#profile'
  get '/explore' => 'pages#explore'

  resources :posts do 
    member do
      put "like", to: "links#upvote"
      put "dislike", to: "links#downvote"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
