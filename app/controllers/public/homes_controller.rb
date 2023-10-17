class Public::HomesController < ApplicationController
  
  def top
    @pet_posts = PetPost.where(pet_status: "lost")
                        .joins(:customer)
                        .where(customer: { active: true })
                        .page(params[:page]).per(8).order('updated_at DESC')
    @tag_list = Tag.all
  end
end
