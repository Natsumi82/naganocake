class Admin::HomesController < ApplicationController
   before_action :authenticate_admin!
  def top
    from = Time.current.beginning_of_day
    to = Time.current.end_of_day
    @today_orders = Order.where(created_at: from..to)
    @items = Item.all
  end
end
