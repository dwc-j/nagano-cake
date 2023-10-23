class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm
    @order = Order.new(order_params)

    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
      ship = Address.find(params[:order][:address_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name

    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]

    else
      render 'new'
    end

    @cart_items = current_customer.cart_items.all
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

    if @order.save
      current_customer.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new(order_id: @order.id)
        @order_detail.item_id = cart_item.item_id
        @order_detail.amount = cart_item.amount
        @order_detail.price = cart_item.item.price
        @order_detail.save
      end

      current_customer.cart_items.destroy_all
      redirect_to complete_public_orders_path
    else
      render 'new'
    end
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = current_customer.orders.find(params[:id])
    @order_details = @order.order_details.all
  end

  private

  def order_params
    params.require(:order).permit(:shipping_fee, :payment_method, :name, :address, :postal_code, :customer_id, :total_payment, :status)
  end

end
