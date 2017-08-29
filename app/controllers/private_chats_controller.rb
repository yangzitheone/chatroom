class PrivateChatsController < ApplicationController
  before_action :authenticate_user!

  def show  #私聊，检查是否已经存在私人聊天组
    p "开始创建私人聊天室"
    @chatroom = if_private_chat_or_not
    params[:id]=@chatroom.id
    p params
    @messages = @chatroom.roommessages.order(created_at: :desc).limit(20)
    @chatroom_user = current_user.room_users.find_by(chatroom_id: @chatroom.id)
    redirect_to chatroom_path
  end

  def if_private_chat_or_not
    p "params[:id]:"+params[:id]
    users = [current_user, User.find(params[:id])]
    user_ids = users.map(&:id).sort
    @chatroomname = "#{user_ids.join("/")}"

    if @chatroom = Chatroom.get_private_chatrooms.where(roomname: @chatroomname).first
      p "查询到记录"
      @chatroom
    else
      # create a new chatroom
      p "需要重新创建聊天室"
      @chatroom = Chatroom.new(roomname: @chatroomname, create_user:current_user.id, private_chat: true)
      @chatroom.room_users = users  #add user to room_users
      @chatroom.save
      @chatroom

    end

  end
end
