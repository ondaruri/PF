class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms.includes(:messages).order("messages.created_at desc")
  end

  def create
    @room = Room.create
    @join_current_user = Entry.create(room_id: @room.id, user_id: current_user.id)
    @join_user = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to room_show_path(@room.id)


  end

  def show
    @room = Room.find(params[:room_id])
    if Entry.where(user_id: current_user.id,room_id: @room.id).present?
    @messages = @room.messages.includes(:user).order("created_at desc")
    @message = Message.new
    @entries = @room.entries
    else
      redirect_to homes_index_path
    end

  end
end
