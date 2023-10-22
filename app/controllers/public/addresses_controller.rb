class Public::AddressesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = current_customer.addresses
    @customer = current_customer
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = current_customer.addresses.new(address_params)
    if @address.save
      flash[:success] = '新しい配送先が作成されました！'
      redirect_to public_addresses_path
    else
      flash[:danger] = '配送先の追加に失敗しました。'
      @customer = current_customer
      @addresses = current_customer.addresses
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:success] = '配送先が更新されました！'
      redirect_to public_addresses_path
    else
      flash[:danger] = '配送先の更新に失敗しました'
      @customer = current_customer
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:success] = '配送先が削除されました！'
    redirect_to public_addresses_path
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
