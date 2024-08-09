class ChatsController < ApplicationController

  def index
    @chats = Chat.where(user_sender == current_user || user_receiver == current_user)
    @chats.order(last_message: desc)
  end

  def create
    user_sender = User.select(current_user)
    user_receiver = User.select(params[:id])
    @chat = Chat.new(user_sender, user_receiver)
    @chat.save
  end

  def destroy
    @chat.find(params[:id])
    @chat.destroy
  end
end
