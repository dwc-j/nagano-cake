Rails.application.routes.draw do

devise_for :customers,skip: [:passwords] , controllers: {
  registrations: "devise_publics/registrations",
  sessions: 'devise_publics/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "devise_admins/sessions"
}


  root :to => "public/homes#top"

  namespace :public do
    get "/about" => "homes#about"

    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
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
