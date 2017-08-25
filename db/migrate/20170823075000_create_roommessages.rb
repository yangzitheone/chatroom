class CreateRoommessages < ActiveRecord::Migration[5.0]
  def change
    create_table :roommessages do |t|
      t.references :chatroom, foreign_key: true
      t.references :user, foreign_key: true
      t.text :body
      t.timestamps
    end
  end
end
