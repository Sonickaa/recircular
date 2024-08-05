class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.integer :user_sender_id
      t.integer :user_receiver_id
      t.string :status

      t.timestamps
    end
  end
end
