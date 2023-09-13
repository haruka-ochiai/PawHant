class Public::PetPostsController < ApplicationController
  def index
    @pet_posts = PetPost.all
    @tag_list = Tag.all
  end

  def show
    @pet_post = PetPost.find(params[:id])
    @pet_post_tags = @pet_post.tags
    @comment = Comment.new
  end

  def new
    @pet_post = PetPost.new
    @pet_post.customer_id = current_customer.id
  end

  def create
    @pet_post = PetPost.new(pet_post_params)
    @pet_post.customer_id = current_customer.id
    tag_list = params[:pet_post][:tag_name].split
    if @pet_post.save
      @pet_post.save_tag(tag_list)
      flash[:notice] = "投稿に成功しました"
      redirect_to pet_post_path(@pet_post)
    else
       render "edit"
    end
  end

  def edit
    @pet_post = PetPost.find(params[:id])
    @pet_post_tags = @pet_post.tags.pluck(:tag_name)
  end

  def update
    @pet_post = PetPost.find(params[:id])
    @pet_posts = PetPost.all
    tag_list = params[:pet_post][:tag_name].split

    if @pet_post.update(pet_post_params)
       @pet_post.save_tag(tag_list)
       flash[:notice] = "情報を変更しました"
       redirect_to pet_post_path(@pet_post)
    else
       render "edit"
    end
  end

  def destroy
    @pet_post = PetPost.find(params[:id])
    @pet_post.destroy
    redirect_to root_path
  end

  private

    def pet_post_params
      params.require(:pet_post).permit(
                                        :customer_id,
                                        :image,
                                        :pet_status,
                                        :species,
                                        :gender,
                                        :age,
                                        :prefecture,
                                        :area,
                                        :occurred_on,
                                        :weight,
                                        :characteristics,
                                        :description)
    end


    def tag_params # tagに関するストロングパラメータ
      params.require(:pet_post).permit(:tag_name)
    end
end
