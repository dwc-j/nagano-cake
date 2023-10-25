class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
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
    @order = Order.find(params[:id])
    if @order.update(order_params)
       flash[:success] = '注文ステータスが更新されました！'
      redirect_to admin_order_path(@order)
    else
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
