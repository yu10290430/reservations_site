Rails.application.routes.draw do
 
 resources :users, only: [:edit, :update]
 get 'users/account'
 get 'users/profile'
 devise_for :users
  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end 
  
  get 'rooms/search'
  resources :rooms, only: [ :index, :new, :show, :create]
  
  post 'reservations/confirm' => 'reservations#confirm'
  post 'reservations/back'
  resources :reservations, only: [:index, :create, :show] 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :posts
root to: 'posts#index'
end
