class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def individual
    customer_id = params[:id]
    @customer = Customer.find(customer_id)
    orders = Order.where(customer_id: customer_id)
    @orders = orders.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    @customer = @order.customer_id
    if @order.nil?
      #flash[:alert] = "Order with id #{params[:id]} not found."
      redirect_to admin_orders_path
    end
  end

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def update
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    if @order.update(order_params)
      flash[:success] = '注文ステータスが更新されました！'
      redirect_to admin_order_path(@order)
    else
      @customer = @order.customer_id
      flash.now[:danger] = '注文ステータスの更新ができませんでした。'
      render :show
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end

end
