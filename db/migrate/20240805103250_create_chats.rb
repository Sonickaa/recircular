class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.integer :user_sender_id
      t.integer :user_receiver_id
      t.string :name
      t.timestamp :last_message

      t.timestamps
    end
  end
end
