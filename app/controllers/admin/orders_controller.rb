class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
  if @order.nil?
    #flash[:alert] = "Order with id #{params[:id]} not found."
    redirect_to admin_orders_path
  end
  end

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def update
    if @order.update(order_params)
      redirect_to order_path(@order), notice: '注文ステータスが正常に更新されました'
    else
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
