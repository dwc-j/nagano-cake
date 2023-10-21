class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items.all
    @total_price = 0
    @cart_items.each do |cart_item|
      item = Item.find(cart_item.item_id)
      price_taxin = item.price * 1.1
      subtotal = price_taxin * cart_item.amount
    @total_price += subtotal
    end
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
