class ChatmessagesController < ApplicationController
  before_action :authenticate_user!, :only => [:index, :update, :join, :edit]

  def index
  end

  def show
  end

  def join
    @chatroom_user = @chatroom.room_users.where(user_id: current_user.id).first_or_create
    redirect_to @chatroom

  end


  def edit
    @chatroomid=params[:chatroom_id]
    @message=params[:body]

    # byebug
    # Roommessage.create!(chatroom_id: @chatroomid,user_id: current_user.id,body:@message)
    Roommessage.create!(chatroom_id: @chatroomid,user_id: current_user.id,body:@message)
    ActionCable.server.broadcast(
        'room_channel',
        roomid: @chatroomid,
        userid: current_user.id,
        message: @message
    )
    redirect_to  chatroom_path
  end

  def update
  end

  def distroy
  end
end
