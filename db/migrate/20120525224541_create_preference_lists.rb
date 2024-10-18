class CreatePreferenceLists < ActiveRecord::Migration
  def self.up
    create_table :preference_lists do |t|
      t.boolean "home", :default => true
      t.string "destination", :limit => 255
      t.date "start"
      t.date "end"
      t.integer "account_user_id"
      t.timestamps
    end
    add_index :preference_lists, ["account_user_id"]
  end

  def self.down
    drop_table :preference_lists
  end
end
