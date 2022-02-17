Rails.application.routes.draw do
 
  resources :posts

  resources :rooms
  
  resources :reservations
  
  devise_for :users
  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end
  
 resource :user, only: [:new, :create, :edit, :show]
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'posts#index'
end
