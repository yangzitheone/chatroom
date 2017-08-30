class PrivateChatsController < ApplicationController
  before_action :authenticate_user!

  def show  #私聊，检查是否已经存在私人聊天组
    p "开始创建私人聊天室"

    @chatroom = if_private_chat_or_not
    params[:id]=@chatroom.id
    p params[:id]
    @chatmeaaage = Chatroom.find(@chatroom.id).roommessages.order(created_at: :desc).limit(10).reverse
    current_user.room_users.where(chatroom_id: @chatroomid).update(last_read_at:Time.zone.now)
     @chatroom_user = current_user.room_users.find_by(chatroom_id: @chatroom.id)
    render "/chatrooms/show"
  end


  def if_private_chat_or_not
    p "params[:id]:"+params[:id]
    @to_user=User.find(params[:id])
    users = [current_user, @to_user]
    user_ids = users.map(&:id).sort
    @chatroomname = "#{user_ids.join("/")}"

    if @chatroom = Chatroom.get_private_chatrooms.where(roomname: @chatroomname).first
      p "查询到记录"
      @chatroom
    else
      # create a new chatroom
      p "需要重新创建聊天室"
      @chatroom = Chatroom.create!(roomname: @chatroomname, create_user:current_user.id, private_chat: true)
      @chatroom.room_users.where(user_id: current_user.id).first_or_create
      @chatroom.room_users.where(user_id: @to_user.id).first_or_create
      p "创建后的聊天室："
      p "创建后的用户："
      @chatroom


    end



  end
end
