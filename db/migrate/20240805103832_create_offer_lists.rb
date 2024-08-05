class CreateOfferLists < ActiveRecord::Migration[7.1]
  def change
    create_table :offer_lists do |t|
      t.integer :offer_id
      t.integer :product_id

      t.timestamps
    end
  end
end
