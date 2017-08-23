class Chatroom < ApplicationRecord
   scope :get_chatrooms, ->{ where(pravite_chat: false) }

   has_many :room_users, dependent: :destroy
   has_many :users, through: :room_users
   has_many :roommessages, dependent: :destroy
end
