class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string "bio", :limit => 1000
      t.string "destination", :limit => 255
      t.string "main_pic"
      t.string "pic2"
      t.string "pic3"
      t.string "pic4"
      t.integer "account_user_id"
      t.timestamps
    end
    add_index :profiles, ["account_user_id"]
  end

  def self.down
    drop_table :profiles
  end
end
