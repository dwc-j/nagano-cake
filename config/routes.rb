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

  # namespace :public do
    resource :customers, only: [:show, :edit, :update] do
      member do
        get :unsubscribe
        patch :withdraw
      end
    end
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete :destroy_all
      end
    end
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post :confirm
        get :complete
      end
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  namespace :admin do
    get "admin" => "homes#top"
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

end
