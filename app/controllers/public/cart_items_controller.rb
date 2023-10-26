class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if @cart_item.amount.nil?
      flash.now[:danger] = "個数を選択してください。"
      redirect_to request.referer
    elsif current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to public_cart_items_path
    elsif @cart_item.save
      @cart_items = current_customer.cart_items.all
      redirect_to public_cart_items_path
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    @cart_items = current_customer.cart_items.all
    render 'index'
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    @cart_items = CartItem.all
    redirect_to public_cart_items_path
  end

  def destroy_all
    flash[:success] = 'カートを空にしました。'
    CartItem.destroy_all
    redirect_to public_cart_items_path
  end


  private

  def cart_item_params

    params.require(:cart_item).permit(:customer_id, :item_id, :amount)

  end

end