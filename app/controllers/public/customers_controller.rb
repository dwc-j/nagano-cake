class Public::CustomersController < ApplicationController
  def show
    @costomer = Costomer.find(params[:id])
  end

  def edit
    @costomer = Costomer.find(params[:id])
  end
  
  def update
     @costomer = Costomer.find(params[:id])
    if @costomer.update(costomer_params)
      redirect_to costomer_path(@costomer) 
    else
      render :edit
    end
  end

  def unsubscribe
    @costomer = Costomer.find(params[:id])
  end

  def withdraw
    @costomer = Costomer.find(params[:id])
    @costomer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
   private

  def costomer_params
    params.require(:costomer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end
  
end
