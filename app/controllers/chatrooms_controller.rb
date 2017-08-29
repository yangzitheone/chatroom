class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    # get chatrooms that donot join
    @chatrooms = Chatroom.all


  end

  def create
     p params
    @chatroom = Chatroom.create(roomname: params.require(:chatroom)[:roomname], create_user:current_user.id)
    p @chatroom.id
    RoomUser.create(chatroom_id:@chatroom.id,user_id:current_user.id,last_read_at:Time.zone.now)
    redirect_to "/"

  end

  def new
    @chatroom = Chatroom.new
  end

  def edit
    p params
    if !Chatroom.find(params[:id]).private_chat
    RoomUser.create(chatroom_id:params[:id],user_id:current_user.id,last_read_at:Time.zone.now)
    end
    redirect_to "/"
  end


  def show
    p params
    @chatroomid = params[:id]
    @chatroom = Chatroom.find(@chatroomid)
    # SendMsgJob.perform(@chatroomid,"nihao a ")
    if @chatroom
    @chatmeaaage = Chatroom.find(@chatroomid).roommessages.order(created_at: :desc).limit(10).reverse
    current_user.room_users.where(chatroom_id: @chatroomid).update(last_read_at:Time.zone.now)
    else
      redirect_to "/"
    end

  end


end
