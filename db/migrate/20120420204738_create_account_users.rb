class CreateAccountUsers < ActiveRecord::Migration
  def self.up
    create_table :account_users do |t|
      t.string "first_name", :limit => 100
      t.string "last_name", :limit => 200
      t.string "email", :limit => 255
      t.string "hashed_password", :limit => 40
      t.string "salt", :limit => 40
      t.string "gender", :limit => 1
      t.string "employment_status", :limit => 100
      t.date "date_of_birth"
      t.string "place_of_birth", :limit => 200
      t.timestamps
    end
  end

  def down
    drop_table :account_users
  end
end
