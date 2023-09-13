class Public::GroupsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update]


  def new
    @group = Group.new
  end

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_customer.id
    @group.group_members.build(customer_id: current_customer.id)
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def group_params
      params.require(:group).permit(:name,
                                    :introduction,
                                    :group_image
                                    )
  end

  def ensure_correct_customer
    @group = Group.find(params[:id])
    unless @group.owner_id == current_customer.id
      redirect_to groups_path
    end
  end
end
