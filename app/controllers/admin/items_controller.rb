class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "新しい商品が追加されました！"
      redirect_to admin_items_path
    else
      flash.now[:danger] = "商品の追加に失敗しました。"
      @genres = Genre.all
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all

  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "商品詳細がアップデートされました！"
      redirect_to admin_item_path(@item)
    else
      flash.now[:danger] = "商品詳細の編集に失敗しました。"
      @genres = Genre.all
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :genre_id, :price, :is_active)
  end

end

