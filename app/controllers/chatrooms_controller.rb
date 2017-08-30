class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chatrooms = Chatroom.where(private_chat: false)

  end

  def create     #创建一个新的chatroom
    @chatroom = Chatroom.create(roomname: params.require(:chatroom)[:roomname], create_user:current_user.id)
    if @chatroom
       RoomUser.create(chatroom_id:@chatroom.id,user_id:current_user.id,last_read_at:Time.zone.now)
       redirect_to "/"
    end

  end

  def new
    @chatroom = Chatroom.new
  end

  def edit
    if !Chatroom.find(params[:id]).private_chat
       RoomUser.create(chatroom_id:params[:id],user_id:current_user.id,last_read_at:Time.zone.now)
    end
       redirect_to "/"
  end


  def show
    p params
    @chatroomid = params[:id]
    @chatroom = Chatroom.find(@chatroomid)
    if @chatroom
       @chatmeaaage = Chatroom.find(@chatroomid).roommessages.order(created_at: :desc).limit(10).reverse
       current_user.room_users.where(chatroom_id: @chatroomid).update(last_read_at:Time.zone.now)
      # users=Chatroom.
      #  if @chatroom.private_chat
      #    @to_user=RoomUser.find_by_sql("select * from room_users where ")

       render "/chatrooms/show"
    end

  end
end

