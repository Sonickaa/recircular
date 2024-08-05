class CreateUserProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.integer :user_id

      t.timestamps
    end
  end
end
