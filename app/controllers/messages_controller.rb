class MessagesController < ApplicationController
  def create
    @room = Room.find_by(params[:room_id])
    @messages = @room.messages.includes(:user).order("created_at desc")

    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :message, :room_id).merge(user_id: current_user.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    # redirect_to room_show_path(@message.room_id)
  end
end
