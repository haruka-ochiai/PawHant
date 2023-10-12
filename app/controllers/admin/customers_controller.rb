class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page]).per(8)
    @reports = Report.all
  end

  def show
    @customer = Customer.find(params[:id])
    @customer_pet = @customer.customer_pets
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "登録情報を変更しました"
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name,
                                     :postcode,
                                     :address,
                                     :phone_number,
                                     :email,
                                     :active)
  end
end
