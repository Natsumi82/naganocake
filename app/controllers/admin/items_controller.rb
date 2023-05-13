class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
     @item = Item.find(params[:id])
  end

  def edit
     @item = Item.find(params[:id])
  end

   def create
     @item = Item.new(product_params)
   end

   def update
     @item = Item.find(params[:id])
   end

    private

  def item_params
    params.require(:item).permit(:name, :genre_id, :price, :is_active)
  end
end
