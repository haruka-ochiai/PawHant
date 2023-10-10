class Public::NotificationsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @notifications = Notification.where(customer_id: current_customer.id)
                                       .order(created_at: :desc)
                                       .page(params[:page])
                                       .per(8)
    @notifications.where(read: false).each do |notification|
      notification.update(read: true)
    end
  end
end