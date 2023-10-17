Rails.application.routes.draw do
  # namespace :public do
  #   get 'addresses/index'
  #   get 'addresses/edit'
  #   get 'orders/new'
  #   get 'orders/confirm'
  #   get 'orders/complete'
  #   get 'orders/index'
  #   get 'orders/show'
  #   get 'cart_items/index'
  #   get 'customers/show'
  #   get 'customers/edit'
  #   get 'customers/unsubscribe'
  #   get 'customers/withdraw'
  #   get 'items/index'
  #   get 'items/show'
  #   get 'homes/top'
  #   get 'homes/about'
  # end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root :to => "public/homes#top"
  
  namespace :public do
    get "/about" => "homes#about"
  
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    resources :cart_items, only: [:index, :update, :destroy, :clear, :create]
    resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  
  namaespace :admin do
    get "/admin" => "homes#top"
    
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

end
