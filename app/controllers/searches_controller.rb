class SearchesController < ApplicationController

  def tag_search
    @tag = Tag.find(params[:tag_id])
    @pet_posts = @tag.pet_posts
  end

  def keyword_search
    @keyword = params[:keyword]
    @pet_posts = PetPost.where("prefecture LIKE ? OR area LIKE ?", "%#{@keyword}%", "%#{@keyword}%").page(params[:page]).per(8)
  end

end
