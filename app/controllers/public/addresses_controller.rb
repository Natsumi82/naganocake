class Public::AddressesController < ApplicationController
  def new
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
  end

  def update
    @address = Address.find(params[:id])
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    flash[:success] = '削除しました'
    redirect_to new_address_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :street_address, :receive_name)
  end
end
