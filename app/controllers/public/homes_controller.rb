class Public::HomesController < ApplicationController
  def top
    @pet_posts = PetPost.all
    @tag_list = Tag.all
  end

  def about
  end
end
