class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @orders = current_client.orders.all
    @customer = Customer.find(current_customer.id)
    @addresses = @customer.addresses
  end

  def pre_create
    @customer = Customer.find(current_customer.id)
    if order_params[:payment].nil?
      flash[:danger] = "支払い方法を入力してください"
      redirect_back(fallback_location: root_path)
    else
      if params[:selected_address] == "radio1"
        session[:payment] = order_params[:payment]
        session[:postal_code] = @customer.postal_code
        session[:street_address] = @customer.street_address
        session[:receive_name] = @customer.first_name + @customer.last_name
        redirect_to orders_confirm_order_path
      elsif params[:selected_address] == "radio2"
        session[:payment] = order_params[:payment]
        if params[:regestrated_address][:regestrated_address] == ""
          flash[:danger] = "登録済み住所を選択してください"
          redirect_back(fallback_location: root_path)
        else
          @selectedaddress = @customer.addresses.find(params[:regestrated_address][:regestrated_address])
          session[:postal_code] = @selected_address.postal_code
          session[:street_address] = @selected_address.street_address
          session[:receive_name] = @selected_address.receive_name
          redirect_to orders_confirm_order_path
        end
      elsif params[:selected_address] == "radio3"
        session[:payment] = order_params[:payment]
        session[:postal_code] = order_params[:postal_code]
        session[:street_address] = order_params[:street_address]
        session[:receive_name] = order_params[:receive_name]

        @address = @customer.addresses.build
        @address.postal_code = order_params[:postal_code]
        @address.street_address = order_params[:street_address]
        @address.receive_name = order_params[:receive_name]
        if @address.save
          flash[:success] = "新しいお届け先が保存されました"
          redirect_to orders_confirm_order_path
        else
          flash[:danger] = "新しいお届け先の情報を正しく入力してください"
          redirect_back(fallback_location: root_path)
        end
      else
        flash[:danger] = "必要情報を入力してください"
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def confirm_order
    @order_items = current_customer.cart_items.all
    @order = Order.new(
      payment: session[:payment].to_i,
      receive_name: session[:receive_name],
      postal_code: session[:postal_code],
      street_address: session[:street_address],
      postage: 800
    )
    @sum = 0
    @subtotals = @cart_items.map { |cart_item| (Item.find(cart_item.item_id).price * 1.1 * cart_item.quantity).to_i }
    @sum = @subtotals.sum
    session[:sum] = @sum
  end

  def create
    @order = Order.new(
      payment: session[:payment].to_i,
      receive_name: session[:receive_name],
      postal_code: session[:postal_code],
      street_address: session[:street_address],
      postage: 800,
      order_status: 0,
      customer_id: current_customer.id
    )
    @order.total_price = session[:sum] + @order.postage
    if @order.customer.cart_items.count >= 1
      @order.save

      @order.customert.cart_items.each do |i|
        @item_order = @order.item_orders.build
        @item_order.order_id = @order.id
        @item_order.item_order_status = 0
        @item_order.item_id = i.item_id
        @item_order.quantity = (i.quantity * 1.1).to_i
        @item_order.once_price = (i.item.price * 1.1).to_i
        @item_order.save
      end

      @order.customer.cart_items.destroy_all
      session[:payment].clear
      session[:receive_name].clear
      session[:postal_code].clear
      session[:street_address].clear
      session.delete(:sum)
      redirect_to orders_after_order_path
    else
      flash[:danger] = "注文確定に失敗しました.   カートが空でないか確認してください"
      redirect_back(fallback_location: root_path)
    end
  end

  def after_order; end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @item_orders = @order.item_orders.all
    @sum = 0
    @subtotals = @item_orders.map { |item_order| item_order.once_price * item_order.quantity }
    @sum = @subtotals.sum
  end

  private

  def order_params
    params.require(:order).permit(:payment, :receive_name, :postal_code, :street_address)
  end
end
