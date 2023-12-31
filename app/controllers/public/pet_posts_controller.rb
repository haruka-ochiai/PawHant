class Public::PetPostsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :tag_search]

  def index
    @pet_posts = PetPost.where(pet_status: "found")
                        .joins(:customer)
                        .where(customer: { active: true })
                        .page(params[:page]).per(8).order('updated_at DESC')
  end

  def show
    if admin_signed_in? || customer_signed_in?
      @pet_post = PetPost.find(params[:id])
      @report = Report.new
      @pet_post_tags = @pet_post.tags
      @comment = Comment.new
      unless @pet_post.customer.active
        redirect_to root_path, alert: "投稿したユーザーは退会済みです。"
      end
    else
    redirect_to new_customer_session_path,
    alert: "詳細を見るには、ログイン、または新規登録が必要です。"
    end
  end

  def new
    @pet_post = PetPost.new
    @pet_post.customer_id = current_customer.id
    @pet_post_tags = @pet_post.tags.new
  end

  def create
    @pet_post = PetPost.new(pet_post_params)
    @pet_post.customer_id = current_customer.id
    tag_list = params[:pet_post][:tag_name].split.uniq
    if @pet_post.save
      @pet_post.save_tag(tag_list)
      flash[:notice] = "投稿に成功しました"
      redirect_to pet_post_path(@pet_post)
    else
       render "new"
    end
  end

  def edit
    @pet_post = PetPost.find(params[:id])
    if @pet_post.customer == current_customer
      @pet_post_tags = @pet_post.tags.pluck(:tag_name)
    else
      redirect_to root_path
    end
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

    if @pet_post.lost?
      redirect_to root_path
    else
      redirect_to pet_posts_path
    end
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


    def tag_params
      params.require(:pet_post).permit(:tag_name)
    end
end
