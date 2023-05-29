class Public::CustomersController < ApplicationController
   before_action :authenticate_customer!

  def show

    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdrow
    @customer = current_customer
  end

  def update
    customer = Customer.find(params[:id])
     if customer.update(customer_params)
      flash[:success] = "個人情報を編集しました"
      redirect_to customer_path(customer.id)
     else
      flash[:danger] = '個人情報の編集に失敗しました'
      render :edit
     end
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    flash[:success] = "アカウントを削除しました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :telephone_number, :postal_code, :address)
  end
end
