class Roommessage < ApplicationRecord
  belongs_to :chatrooms
  belongs_to :user
end
