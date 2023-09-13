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

  def new_mail
    @group = Group.find(params[:group_id])
  end

  def send_mail
    @group = Group.find(params[:group_id])
    @group_name = @group.name
    @group_members = @group.group_members.map(&:customer)
    @mail_title = params[:mail_title]
    @mail_content = params[:mail_content]
    ContactMailer.send_mail(@mail_title, @mail_content,@group_members).deliver
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
