Rails.application.routes.draw do
  
  # Routes for main resources
  resources :items
  resources :purchases
  resources :item_prices
  resources :users
  resources :orders
  resources :order_items
  resources :schools
  resources :sessions

  # Authentication routes
  get 'user/edit' => 'users#edit', :as => :edit_current_user
  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout

  # Semi-static page routes
  get 'home' => 'home#home', as: :home
  get 'about' => 'home#about', as: :about
  get 'contact' => 'home#contact', as: :contact
  get 'privacy' => 'home#privacy', as: :privacy

  # guest/customer store routes
  get 'pieces' => 'items#pieces', as: :pieces
  get 'boards' => 'items#boards', as: :boards
  get 'clocks' => 'items#clocks', as: :clocks
  get 'supplies' => 'items#supplies', as: :supplies

  # cart
  get 'add_to_cart/:id' => 'carts#add_to_cart', as: :add_to_cart
  get 'remove/:item_id' => 'carts#remove', as: :remove_from

  # get '/add_item_to_cart/:item_id' => 'cart#add_item_to_cart', :as :add_to_cart

  
  # get 'show_cart' => 'carts#show_cart', as: :show_cart
  get 'cart' => 'carts#show', as: :cart
  get 'checkout' => 'orders#new', as: :checkout
    
  # Set the root url (default route)
  root :to => 'home#home'

end
