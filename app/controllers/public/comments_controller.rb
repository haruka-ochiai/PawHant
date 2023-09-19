class Public::CommentsController < ApplicationController

  def create
    pet_post = PetPost.find(params[:pet_post_id])
    comment = current_customer.comments.new(comment_params)
    comment.pet_post_id = pet_post.id
    if comment.save
      redirect_to request.referer
    else
      @pet_post = PetPost.find(params[:pet_post_id])
      @pet_post_tags = @pet_post.tags
      @comment = Comment.new
      flash.now[:alert] = "コメントの投稿に失敗しました"
      render 'public/pet_posts/show'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to pet_post_path(params[:pet_post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
