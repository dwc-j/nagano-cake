class Admin::OrderDetailsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      flash[:success] = '製作ステータスが更新されました!'
      redirect_to admin_order_path(@order_detail.order)
    else
      flash.now[:danger] = "製作ステータスの更新ができませんでした。"
      render 'admin/orders/show'
    end
  end
  
  private

  def set_order_detail
    @order_detail = OrderDetail.find(params[:id])
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
  
end
