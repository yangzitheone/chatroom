class CreateRoomUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :room_users do |t|
      t.references :chatroom, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :last_read_at
      t.timestamps
    end
  end
end
