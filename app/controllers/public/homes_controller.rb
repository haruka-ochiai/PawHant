class Public::HomesController < ApplicationController
  def top
    @pet_posts = PetPost.where(pet_status: "lost").page(params[:page]).per(8).order('updated_at DESC')
    @tag_list = Tag.all
  end

  def about
  end
end
