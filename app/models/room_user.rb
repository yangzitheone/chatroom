class RoomUser < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  before_create :set_last_read_at

  def set_last_read_at
    self.last_read_at=self.created_at

  end
end
