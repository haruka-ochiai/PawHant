class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @pet_post = PetPost.find(params[:pet_post_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.pet_post_id = @pet_post.id
    @comment.save
  end


  def destroy
    @pet_post = PetPost.find(params[:pet_post_id])
    @comment = Comment.find(params[:id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
