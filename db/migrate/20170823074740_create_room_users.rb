class CreateRoomUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :room_users do |t|
      t.string :chatroom
      t.string :userid

      t.timestamps
    end
  end
end
