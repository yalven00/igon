class CreateAccountContacts < ActiveRecord::Migration
  def self.up
    create_table :account_contacts do |t|
      t.string "primary_email", :limit => 255
      t.string "secondary_email", :limit => 255
      t.integer "primary_phone", :limit => 20
      t.integer "secondary_phone", :limit => 20
      t.integer "account_user_id"
      t.timestamps
    end
    add_index :account_contacts, ["account_user_id"]
  end

  def down
    drop_table :account_contacts
  end

end