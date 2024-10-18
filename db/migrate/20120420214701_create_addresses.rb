class CreateAddresses < ActiveRecord::Migration

  def self.up
    create_table :addresses do |t|
      t.string "line_1", :limit => 255
      t.string "line_2", :limit => 255
      t.string "city", :limit => 255
      t.string "state", :limit => 100
      t.integer "zip", :limit => 5
      t.string "country", :limit => 255
      t.integer "account_user_id"
      t.timestamps
    end
    add_index :addresses, ["account_user_id"]
  end

  def self.down
    drop_table "addresses"
  end

end
