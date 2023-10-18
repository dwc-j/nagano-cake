Rails.application.routes.draw do


devise_for :customers,skip: [:passwords] , controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}


  root :to => "public/homes#top"
  get "about" => "homes#about"
  resources :items, only: [:index, :show]
  
  namespace :public do
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end


  namespace :admin do
    get "/admin" => "homes#top"
  end

  
  namespace :admin do
    get "/admin" => "homes#top"
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end




end
