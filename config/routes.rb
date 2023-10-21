Rails.application.routes.draw do

devise_for :customers,skip: [:passwords] , controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# devise_scope :customer do
#   get '/customers/sign_out' => 'public/sessions#destroy'
# end

devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

devise_scope :admin do
  get '/admins/sign_out' => 'admin/sessions#destroy'
end

  root :to => "public/homes#top"
  get "/about" => "public/homes#about"

  get "admin" => "admin/homes#top"


  namespace :public, path: '' do #URLにpublicが入らないようにしました。
  
    get "/customers/information" => "customers#show"
    get "/customers/information/edit" => "customers#edit"
    patch "/customers/information" => "customers#update"
    get "/customers/unsubscribe", to: "customers#unsubscribe"
    patch "/customers/withdraw", to: "customers#withdraw"
  
    resources :items, only: [:index, :show]  #nameスペースの外側にあったのを中に入れました。
    
    # resource :customers, only: [:show, :edit, :update] do
    #   member do
    #     get :unsubscribe
    #     patch :withdraw
    #   end
    # end
    
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
