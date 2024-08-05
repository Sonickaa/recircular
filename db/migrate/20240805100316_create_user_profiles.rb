class CreateUserProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :bio
      t.string :profile_picture
      t.string :address
      t.timestamps
    end
  end
end
