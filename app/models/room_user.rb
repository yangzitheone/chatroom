class RoomUser < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
end
