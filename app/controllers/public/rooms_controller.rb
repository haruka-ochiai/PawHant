class Public::RoomsController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @room = Room.find(params[:id])
    if Entry.where(:customer_id => current_customer.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
      @myCustomerId = current_customer.id
    else
      redirect_back
    end
  end

  def create
    @room = Room.create(customer_id: current_customer.id)
    @entry1 = Entry.create(:room_id => @room.id, :customer_id => current_customer.id)
    @entry2 = Entry.create(params.require(:entry).permit(:customer_id, :room_id).merge(:room_id => @room.id))
    redirect_to room_path(@room.id)
  end
end
