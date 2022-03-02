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
<<<<<<< HEAD
<<<<<<< HEAD
  resources :reservations, only: [:index, :create, :show] 
=======
  resources :reservations, only: [:index, :new, :create, :show]
  
>>>>>>> parent of 7300639 (Merge pull request #6 from yu10290430/develop)
=======
  resources :reservations, only: [:index, :new, :create, :show]
  
>>>>>>> parent of 7300639 (Merge pull request #6 from yu10290430/develop)
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :posts
root to: 'posts#index'
end
