class Public::PetPostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @pet_post = PetPost.new
  end

  def create
    @pet_post = PetPost.new(pet_post_params)
    @pet_post.customer_id = current_customer.id
     # 受け取った値を,で区切って配列にする
    tag_list = params[:pet_post][:tag_name].split(',')
    if @pet_post.save
      @pet_post.save_tags(tag_list)
      redirect_to root_path, notice:'投稿が完了しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
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
                                      :description,
                                      :tag_name)
  end


  def tag_params # tagに関するストロングパラメータ
    params.require(:pet_post).permit(:tag_name)
  end
end
