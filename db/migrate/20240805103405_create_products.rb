class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :product_picture
      t.string :product_title
      t.string :product_condition
      t.string :product_description
      t.timestamps
    end
  end
end
