class Public::NotificationsController < ApplicationController

  def index
    @notifications = current_customer.notifications.order(created_at: :desc).page(params[:page]).per(10)
    @notifications.where(read: false).each do |notification|
      notification.update(read: true)
    end
  end

end