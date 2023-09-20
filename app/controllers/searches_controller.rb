class SearchesController < ApplicationController
  before_action :authenticate_customer!

  def keyword_search
    @keyword = params[:keyword]
    @pet_posts = PetPost.where("prefecture LIKE ? OR area LIKE ?", "%#{@keyword}%", "%#{@keyword}%").page(params[:page]).per(8)
  end

  def new
    @q = PetPost.ransack(params[:q])
  end

  def detail
    @q = PetPost.ransack(params[:q])
    @pet_posts = @q.result(distinct: true).page(params[:page]).per(8)
  end

end
