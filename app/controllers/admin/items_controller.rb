class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end
end
