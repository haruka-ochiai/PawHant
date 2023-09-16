class Admin::PetPostsController < ApplicationController

  def index
    @pet_posts = PetPost.where(pet_status: "found").page(params[:page]).per(8).order('updated_at DESC')
  end

  def show
    if admin_signed_in? || customer_signed_in?
      @pet_post = PetPost.find(params[:id])
      @pet_post_tags = @pet_post.tags
      @comment = Comment.new
    end
  end

  def destroy
    @pet_post = PetPost.find(params[:id])
    @pet_post.destroy
    redirect_to root_path, notice: "投稿が削除されました。"
  end

   # カスタマーごとの投稿一覧表示
  def index_for_customer
    @customer = Customer.find(params[:id])
    @pet_posts = @customer.pet_posts.page(params[:page]).per(8).order('updated_at DESC')
  end
end
