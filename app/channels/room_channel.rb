class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_channel'
  end
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def print_log(data)
    p ">>>> #{data['msg']}"
  end
end