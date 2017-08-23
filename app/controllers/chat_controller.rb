class ChatController < ApplicationController

  def index
    @chatrooms=Chatroom.get_chatrooms
  end
end
