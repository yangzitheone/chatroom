class Chatroom < ApplicationRecord
   scope :get_private_chatrooms, ->{ where(private_chat: true) }
   scope :get_public_chatrooms, ->{ where(private_chat: false) }

   has_many :room_users, dependent: :destroy
   has_many :users, through: :room_users
   has_many :roommessages, dependent: :destroy


end

