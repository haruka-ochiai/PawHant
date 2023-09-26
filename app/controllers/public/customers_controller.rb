class Public::CustomersController < ApplicationController
  before_action :is_matching_login_customer, only: [:edit, :update]
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    @customer_pet = @customer.customer_pets

    # DMの処理
    @currentCustomerEntry = Entry.where(customer_id: current_customer.id)
    @customerEntry = Entry.where(customer_id: @customer.id)
    if @customer.id == current_customer.id
    else
      @currentCustomerEntry.each do |cc|
        @customerEntry.each do |c|
          if cc.room_id = c.room_id then
            @isRoom = true
            @roomId = cc.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
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
    redirect_to :root
  end

  # リアクションした投稿一覧
  def sighting_pet_posts
    @customer = Customer.find(params[:customer_id])
    @sighting_pet_posts = @customer.sighting_pet_posts.page(params[:page]).per(8).order('updated_at DESC')
  end


  private

  def customer_params
    params.require(:customer).permit(
                                      :name,
                                      :postcode,
                                      :address,
                                      :phone_number,
                                      :email)
  end


  def is_matching_login_customer
    customer = Customer.find(params[:id])
    unless customer.id == current_customer.id
      redirect_to root_path
    end
    if current_customer.is_guest?
    redirect_to root_path, alert: "ゲストユーザーは編集できません。"
    end
  end
end
