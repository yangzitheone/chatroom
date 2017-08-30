class RoomUser < ApplicationRecord
  before_create :set_last_read_at

  belongs_to :chatroom
  belongs_to :user

  def set_last_read_at
    self.last_read_at = self.created_at
  end
end
