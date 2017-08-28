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
    RoomUser.create(chatroom_id:params[:id],user_id:current_user.id,last_read_at:Time.zone.now)
    redirect_to "/"
  end


  def show
    p params
    @chatroomid = params[:id]
    @chatroom = Chatroom.find(@chatroomid)
    # SendMsgJob.perform(@chatroomid,"nihao a ")
    gon.push({current_user_id: current_user.id})
    gon.push({current_room_id: @chatroomid})
    if @chatroom
    @chatmeaaage = Chatroom.find(@chatroomid).roommessages.order(created_at: :asc).limit(20)
    else
      redirect_to "/"
    end

  end

  def update

    ActionCable.server.broadcast(
        'room_channel',
        roomid: @chatroomid,
        userid: current_user.id,
        message: 'nihao'
    )
  end

  def destroy
  end

end
