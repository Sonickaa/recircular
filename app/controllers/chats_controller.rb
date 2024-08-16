class ChatsController < ApplicationController

  def index
    @chats = Chat.where("user_sender_id = ? OR user_receiver_id = ?", current_user.id, current_user.id).order("last_message DESC")
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def find_chat
    @chat = Chat.where("user_sender_id = ? and user_receiver_id = ?", current_user.id, params[:id])
    @chat += Chat.where("user_sender_id = ? and user_receiver_id = ?", params[:id], current_user.id)
    return @chat
  end

  def find_or_create
    @chat = find_chat
    if @chat == []
      @chat = [create]
    end
    p @chat
    redirect_to chat_show_path(@chat)
  end

  def create
    # user_sender = User.select(current_user)
    # user_receiver = User.select(params[:id])
    @chat = Chat.new(user_sender_id: current_user.id, user_receiver_id: params[:id])
    @chat.save
    return @chat
  end

  def destroy
    @chat.find(params[:id])
    @chat.destroy
  end
end
