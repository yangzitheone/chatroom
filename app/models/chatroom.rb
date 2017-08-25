class Chatroom < ApplicationRecord
   scope :get_private_chatrooms, ->{ where(private_chat: true) }
   scope :get_public_chatrooms, ->{ where(private_chat: false) }

   has_many :room_users, dependent: :destroy
   has_many :users, through: :room_users
   has_many :roommessages, dependent: :destroy

   def self.direct_message_for_users(users)
   user_ids = users.map(&:id).sort
   name = "DM:#{user_ids.join("/")}"

   if chatroom = get_private_chatrooms.where(roomname: name).first
      chatroom
   else
      # create a new chatroom
      chatroom = new(roomname: name, private_chat: true)
      chatroom.users = users
      chatroom.save
      chatroom
   end

end
end

