class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all

    @total_price = 0
    @cart_items.each do |cart_item|
      item = Item.find(cart_item.item.id)
      price_taxin = item.price * 1.1
      subtotal = price_taxin * cart_item.amount
    @total_price += subtotal
    end

    #@price_taxin = cart_item.item.add_tax_price
    #@subtotal = @price_taxin * amount
    #@total_price += @subtotal
    # @total_price = 0
    # @cart_items.each do |cart_item|
    #   item = Item.find(cart_item.item_id)
    #   price_taxin = item.price * 1.1
    #   subtotal = price_taxin * cart_item.amount
    #   @total_price += subtotal
    # end

  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to public_cart_items_path
    elsif @cart_item.save
      @cart_items = current_customer.cart_items.all
    　render 'index'
    else
      render 'index'
    end
  end

  def update
    @cart_items = current_customer.cart_items.all
    @item = Item.find(@cart_items.items.id)
    @item.update
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    @cart_items = CartItem.all
    render 'index'
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    render 'index'
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id,:item_id, :amount)
  end

end