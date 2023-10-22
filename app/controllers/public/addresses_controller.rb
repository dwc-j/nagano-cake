class Public::AddressesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = current_customer.addresses.new(address_params)
    if @address.save
      redirect_to public_addresses_path, notice: '配送先が正常に作成されました'
    else
      @addresses = current_customer.addresses
      render :index
    end
  end

  def update
    if @address.update(address_params)
      redirect_to addresses_path, notice: '配送先が正常に更新されました'
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to addresses_path, notice: '配送先が正常に削除されました'
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
