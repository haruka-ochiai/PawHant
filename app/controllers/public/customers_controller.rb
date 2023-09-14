class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "登録情報を変更しました"
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end

  def check
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(active: false)
    reset_session
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to :root #削除に成功すればrootページに戻る
  end

  def customer_params
    params.require(:customer).permit(
                                      :name,
                                      :postcode,
                                      :address,
                                      :phone_number,
                                      :email,
                                      )
  end

end
