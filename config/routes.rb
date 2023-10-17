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
end
