Rails.application.routes.draw do

 devise_for :users
  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end 
 
  get 'users/account'
  get 'users/profile'
 resources :user, only: [:new, :create, :edit, :show, :update]
 
  
  get 'rooms/search'
  resources :rooms, only: [ :index, :new, :show, :create]
  
  post 'reservations/confirm' => 'reservations#confirm'
  post 'reservations/back'
  resources :reservations, only: [:index, :new, :create, :show]
  
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :posts
root to: 'posts#index'
end
