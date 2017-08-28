class SendMsgJob < ApplicationJob
  queue_as :default

  def perform(roomid,msg)
    # Do something later
      ActionCable.server.broadcast(
          'room_channel',
          title: 'chat with ..',
          body: msg
      )
    end

  end
