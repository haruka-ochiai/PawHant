class Public::PetPostsController < ApplicationController
  def index
  end

  def show
  end

  def new

  end

  def create
   
  end

  def edit
  end

  def update
  end

  def destroy
  end

   private

  def customer_pet_params
    params.require(:customer_pet).permit(
                                          :customer_id,
                                          :image,
                                          :pet_status,
                                          :species,
                                          :name,
                                          :gender,
                                          :age,
                                          :weight,
                                          :characteristics)
  end
end
