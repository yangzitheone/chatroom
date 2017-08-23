class CreateRoommessages < ActiveRecord::Migration[5.0]
  def change
    create_table :roommessages do |t|
      t.string :roomname
      t.string :userid
      t.string :message

      t.timestamps
    end
  end
end
