Rails.application.routes.draw do

root 'categories#index'
 get 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'


    devise_for :users
    resources :categories
  resources :products
    resources :carts



end
