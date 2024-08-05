class CreateWants < ActiveRecord::Migration[7.1]
  def change
    create_table :wants do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
