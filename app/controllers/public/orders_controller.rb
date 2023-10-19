class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @addresses = current_customer.address.all
  end

  def confirm
    @order = Order.new
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      
    elsif params[:order][:address_option] == "1"
      ship = Address.find(params[:order][:customer_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name 
      
    elsif params[:order][:address_option] = "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    
    else
      render 'new'
    end
  end

  def complete
  end
  
  def create
  end

  def index
  end

  def show
  end
  
  private
  
    def order_params
        params.require(:order).permit(:postage, :payment_method, :shipping_name, :shipping_address, :shipping_post_code ,:member_id,:total_payment,:status)
    end
end
