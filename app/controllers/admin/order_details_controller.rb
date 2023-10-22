class Admin::OrderDetailsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def update
    if @order_detail.update(order_detail_params)
      redirect_to order_path(@order_detail.order), notice: '制作ステータスが正常に更新されました'
    else
      render 'orders/show'
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
