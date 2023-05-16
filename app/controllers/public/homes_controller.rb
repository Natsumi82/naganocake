class Public::HomesController < ApplicationController
  def top
    @items = Item.joins(:genres).where(genres: { is_active: true }).where(is_active: true).order("RANDOM()").limit(6)
    @genres = Genre.where(is_active: true)
  end

  def about
     @genres = Genre.where(is_active: true)
  end
end
