Rails.application.routes.draw do
 
  get 'users/account'
  get 'users/profile'
   devise_for :users
  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end
 resources :user, only: [:new, :create, :edit, :show, :update]
 
  
  get 'rooms/search'
  resources :rooms, only: [ :index, :new, :show, :create]

  resources :reservations
  
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :posts
root to: 'posts#index'
end
