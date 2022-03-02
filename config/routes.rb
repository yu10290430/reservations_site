Rails.application.routes.draw do
 
  resources :posts
  resources :rooms 
  resources :reservations
  
  devise_for :users
  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end
<<<<<<< HEAD
 resources :user, only: [:new, :create, :edit, :show, :update]
 
  
  get 'rooms/search'
  resources :rooms, only: [ :index, :new, :show, :create]
<<<<<<< HEAD
  
  post 'reservations/confirm' => 'reservations#confirm'
  post 'reservations/back'
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  resources :reservations, only: [:index, :create, :show] 
=======
  resources :reservations, only: [:index, :new, :create, :show]
=======

  resources :reservations
>>>>>>> parent of f2b9aaa (Merge pull request #5 from yu10290430/develop)
  
>>>>>>> parent of 7300639 (Merge pull request #6 from yu10290430/develop)
=======
  resources :reservations, only: [:index, :new, :create, :show]
  
>>>>>>> parent of 7300639 (Merge pull request #6 from yu10290430/develop)
=======
  resources :reservations, only: [:index, :new, :create, :show]
  
>>>>>>> parent of 7300639 (Merge pull request #6 from yu10290430/develop)
=======
  
 resource :user, only: [:new, :create, :edit, :show]
>>>>>>> parent of a0252ed (Merge pull request #3 from yu10290430/develop)
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'posts#index'
end
