class ChatmessagesController < ApplicationController
  before_action :authenticate_user!, :only => [:index, :update, :join, :edit]

  def join
    @chatroom_user = @chatroom.room_users.where(user_id: current_user.id,
                                                private_chat:false
                                                ).first_or_create
    redirect_to @chatroom
  end

  def new
    p params
    @chatroomid = params[:chatroom_id]
    @message = params[:body]
    @roommsg = Roommessage.create!(chatroom_id: @chatroomid, user_id: current_user.id, body: @message)

    if @roommsg
        Chatroom.find(@chatroomid).update!(updated_at:Time.zone.now)
        @chatroom=Chatroom.find(@chatroomid)
        ActionCable.server.broadcast(
                                    'room_channel',
                                    roomid: @chatroomid,
                                    roomname:@chatroom.roomname,
                                    private_chat:@chatroom.private_chat,
                                    username: current_user.username,
                                    userid: current_user.id,
                                    message: @message,
                                    created_at:Time.zone.now.to_s
                                    )
    end
    redirect_to  chatroom_path(id:@chatroomid )
  end

end
