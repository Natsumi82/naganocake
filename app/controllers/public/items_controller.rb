class Public::ItemsController < ApplicationController
before_action :ensure_enabled_item, only: [:show, :update]

  def index
    @genres = Genre.where(is_enabled: true)
    if params[:genre_id].nil?
      @items_all = Item.joins(:genre).where(genres: { is_enabled: true }).where(is_enabled: true)
      @items = @items_all.page(params[:page]).reverse_order
      @index = "商品"
    else
      @items_all = Item.joins(:genre).where(genres: { is_enabled: true, id: params[:genre_id] }).where(is_enabled: true)
      @items = @items_all.page(params[:page]).reverse_order
      @index = Genre.find( params[:genre_id]).name
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.where(is_enabled: true)
  end

  def top
    @items = Item.joins(:genre).where(genres: { is_enabled: true }).where(is_enabled: true).order("RANDOM()").limit(6)
    @genres = Genre.where(is_enabled: true)
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :image_id, :is_enabled, :genre_id)
  end

  def ensure_enabled_product
    items = Item.joins(:genre).where(genres: { is_enabled: true }).where(is_enabled: true)
    unless items.any? { |p| p == Item.find(params[:id]) }
      redirect_back(fallback_location: root_path)
    end
  end
end
