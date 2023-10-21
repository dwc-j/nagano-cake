class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer
  
  
  def show

  end

  def edit
  end
  
  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer) 
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
   private

  def set_customer
    @customer = current_customer
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end
  
end
