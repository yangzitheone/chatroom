class ChatsController < ApplicationController

  def index
    @chatrooms=Chatroom.get_private_chatrooms
  end
end
