class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.references :user_sender, null: false, foreign_key: { to_table: :users }
      t.references :user_receiver, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.timestamp :last_message
      t.timestamps
    end
  end
end
