class CreateChatrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chatrooms do |t|
      t.string :roomname
      t.string :create_user
      t.boolean :private_chat , default: false
      t.timestamps
    end
  end
end
