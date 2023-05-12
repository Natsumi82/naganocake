class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def top
    from = Time.current.beginning_of_day
    to = Time.current.end_of_day
    @today_orders = Order.where(created_at: from..to)
  end


  def index
    @orders = Order.page(params[:page]).per(10)
  end


  def show
    @order = Order.find(params[:id])
    @item_orders = @order.item_orders.all
    @sum = 0
    @subtotals = @item_orders.map{ |item_order| item_order.once_price * item_order.quantiny }
    @sum = @subtotals.sum
  end

   def oeder_status_update
     @order = Order.find(params[:order][:id])
   end


   def item_orders_status_update
    @item_order = ItemOrder.find(params[:item_order][:id])
   end


   private

   def order_params
     params.require(:order).permit(:order_status)
   end

   def item_order_params
     params.require(:item_order).permit(:item_orders_status, :id)
   end


end
