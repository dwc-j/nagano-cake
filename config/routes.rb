Rails.application.routes.draw do


devise_for :customers,skip: [:passwords] , controllers: {
  registrations: "devise_publics/registrations",
  sessions: 'devise_publics/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "devise_admins/sessions"
}


  root :to => "public/homes#top"
  get "about" => "homes#about"
  resources :items, only: [:index, :show]

  # namespace :public do
    resource :customers, only: [:show, :edit, :update] do
      member do
        get :unsubscribe
        patch :withdraw
      end
    end
    resources :cart_items, only: [:index, :update, :destroy, :create] do
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    
    resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  # end


  namespace :admin do
    get "/admin" => "homes#top"
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end




end
