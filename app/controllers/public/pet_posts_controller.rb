class Public::PetPostsController < ApplicationController
  def index
    @pet_posts = PetPost.all
  end

  def show
    @pet_post = PetPost.find(params[:id])
  end

  def new
    @pet_post = PetPost.new
    @pet_post.customer_id = current_customer.id
  end

  def create
    @pet_post = PetPost.new(pet_post_params)
    @pet_post.customer_id = current_customer.id
    # tag_paramsをsplitメソッドを用いて配列に変換する
    input_tags = tag_params[:tag_name].to_s.split
    # create_tagsはtopic.rbにメソッドを記載している
    @pet_post.create_tags(input_tags)
    if @pet_post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to pet_post_path(@pet_post)
    else
       render "edit"
    end
  end

  def edit
    @pet_post = PetPost.find(params[:id])
  end

  def update
    @pet_post = PetPost.find(params[:id])
    @pet_posts = PetPost.all
    if @pet_post.update(pet_post_params)
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
