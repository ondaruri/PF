class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms.includes(:messages).order("messages.created_at desc")
    # ログインユーザーが属しているルームのIDを全て抽出して配列化
    current_entries = current_user.entries
    my_room_ids = []
    current_entries.each do |entry|
      my_room_ids << entry.room.id
    end
    # さらにuser_idがログインユーザーでは無いレコードを抽出
    @another_entries = Entry.where(room_id: my_room_ids).where.not(user_id: current_user.id)

    @notifications = current_user.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def create
    @room = Room.create
    @join_current_user = Entry.create(room_id: @room.id, user_id: current_user.id)
    @join_user = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to room_show_path(@room.id)
  end

  def show
    @room = Room.find(params[:room_id])
    # if Entry.where(user_id: current_user.id,room_id: @room.id).present?
    @messages = @room.messages.order("created_at desc")
    @message = Message.new
    @entries = @room.entries

    # else
    #   redirect_to homes_index_path
    # end
  end

end
