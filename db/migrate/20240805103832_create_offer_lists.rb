class CreateOfferLists < ActiveRecord::Migration[7.1]
  def change
    create_table :offer_lists do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
