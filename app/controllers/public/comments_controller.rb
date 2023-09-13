class Public::CommentsController < ApplicationController
  def create
    pet_post = PetPost.find(params[:pet_post_id])
    comment = current_customer.comments.new(comment_params)
    comment.pet_post_id = pet_post.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to pet_post_path(params[:pet_post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
