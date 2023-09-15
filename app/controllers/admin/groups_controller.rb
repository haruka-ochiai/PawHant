class Admin::GroupsController < ApplicationController

  def index
    @groups = Group.all
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
