class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @price_taxin = @item.add_tax_price
    @cart_item = CartItem
  end

  def create

  end
end
