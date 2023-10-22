class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @price_taxin = @item.add_tax_price
    @cart_item = CartItem
  end

  def create
    redirect_to public_items_path
  end

  private

  def item_params
    params.require(:items).permit(:genre_id, :name, :explanation, :price, :is_active)
  end

end
