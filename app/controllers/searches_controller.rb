class SearchesController < ApplicationController

  def keyword_search
    @keyword = params[:keyword]
    @pet_posts = PetPost.where("prefecture LIKE ? OR area LIKE ?", "%#{@keyword}%", "%#{@keyword}%").page(params[:page]).per(8)
  end

end
