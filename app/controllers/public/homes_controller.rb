class Public::HomesController < ApplicationController
  def top
    @pet_posts = PetPost.all
  end

  def about
  end
end
