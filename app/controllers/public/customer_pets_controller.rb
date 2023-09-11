class Public::CustomerPetsController < ApplicationController

  def new
    @customer = current_customer
    @customer_pet = @customer.customer_pets.build
  end

  def create
    @customer = current_customer
    @customer_pet = @customer.customer_pets.build(customer_pets_params)
    if @customer_pet.save
      flash[:notice] = "ペット情報を登録しました"
      redirect_to customer_path(@customer)
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

   private

  def customer_pets_params
    params.require(:customer_pet).permit(
                                         :customer_id,
                                         :image,
                                         :name,
                                         :pet_status,
                                         :species,
                                         :gender,
                                         :age,
                                         :weight,
                                         :characteristics
                                         )
  end



end