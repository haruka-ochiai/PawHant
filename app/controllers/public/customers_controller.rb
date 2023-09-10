class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "登録情報を変更しました"
      redirect_to customer_path
    else
      render :edit
    end
  end

  def check
  end

  def destroy
  end

  def customer_params
    params.require(:customer).permit(:name,:postcode, :address, :phone_number, :email)
  end

end
