class Public::AddressesController < ApplicationController
  
  before_action :authenticate_customer!
  
  def index
    @address = current_customer.addresses.new
    @addresses = current_customer.addresses
  end

  def edit
  end
  
  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path, notice: '配送先が正常に作成されました'
    else
      @addresses = Address.all
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
