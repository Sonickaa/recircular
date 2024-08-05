class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
