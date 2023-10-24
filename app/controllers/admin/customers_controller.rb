class Admin::CustomersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
     @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "会員情報がアップデートされました！"
      redirect_to admin_customer_path(@customer)
    else
      flash.now[:danger] = "会員情報のアップデートができませんでした。"
      render 'edit'
    end
  end
  
  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :is_active, :email, :telephone_number, )
  end
end
