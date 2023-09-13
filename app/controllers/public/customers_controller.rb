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
      redirect_to admin_customer_path
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
