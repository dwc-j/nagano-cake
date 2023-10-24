class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!
  before_action :set_customer

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
     @customer = current_customer
    if @customer.update(customer_params)
      flash[:success] = "会員情報がアップデートされました！"
      redirect_to public_customers_information_path
    else
      flash.now[:danger] = "会員情報の更新に失敗しました。"
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    if @customer.update(is_active: false)
      flash[:success] = "退会処理が完了しました。"
      reset_session
      redirect_to root_path
    else
    flash.now[:danger] = "退会処理に失敗しました。"
    render :show
    end
  end

   private


  def set_customer
    @customer = current_customer
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
