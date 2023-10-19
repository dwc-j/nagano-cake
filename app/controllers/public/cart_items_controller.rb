class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items.all
    @item = Item.find(@cart_items.items.id)
    @price_taxin = @cart_items.items.price * 1.1
    @subtotal = @price_taxin * amount
    @total_price = @cart_items.inject(0) { |sum, item| sum + @subtotal }
  end
  
  def update
    @cart_items = current_customer.cart_items.all
    @item = Item.find(@cart_items.items.id)
    @item.update
    redirect_to cart_items_path
  end
  
  def destroy
    @cart_items = current_customer.cart_items.all
    @item = Item.find(@cart_items.items.id)
    @item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
  end
  
  def create
    @order = Order.new
  end
end
