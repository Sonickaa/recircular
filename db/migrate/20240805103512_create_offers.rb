class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.references :user_sender, null: false, foreign_key: { to_table: :users }
      t.references :user_receiver, null: false, foreign_key: { to_table: :users }
      t.string :status
      t.timestamps
    end
  end
end
