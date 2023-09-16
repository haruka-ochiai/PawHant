class Public::PetPostsController < ApplicationController

  def index
    @pet_posts = PetPost.where(pet_status: "found").page(params[:page]).per(8).order('updated_at DESC')
  end

  def show
    if admin_signed_in? || customer_signed_in?
      @pet_post = PetPost.find(params[:id])
      @pet_post_tags = @pet_post.tags
      @comment = Comment.new
    else
    redirect_to new_customer_session_path,
    alert: "詳細を見るには、ログイン、または新規登録が必要です。"
    end
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
    flash[:notice] = "投稿を削除しました"
    redirect_to root_path
  end

  # タグが含まれる投稿を表示
  def tag_search
    @tag = Tag.find(params[:tag_id])
    @pet_posts = @tag.pet_posts.page(params[:page]).per(8).order('updated_at DESC')
  end

  # カスタマーごとの投稿一覧表示
  def index_for_customer
    @customer = Customer.find(params[:id])
    @pet_posts = @customer.pet_posts.page(params[:page]).per(8).order('updated_at DESC')
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
