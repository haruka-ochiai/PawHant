class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @groups = Group.all.page(params[:page]).per(8).order('updated_at DESC')
  end

  def show
    @group = Group.find(params[:id])
    @customers = @group.customers
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to admin_groups_path, notice: "グループが削除されました。"
  end
end
