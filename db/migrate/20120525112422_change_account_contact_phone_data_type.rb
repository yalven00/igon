class ChangeAccountContactPhoneDataType < ActiveRecord::Migration
  def self.up
      change_table :account_contacts do |t|
        t.change :primary_phone, :string
        t.change :secondary_phone, :string
      end
    end

  def self.down
      change_table :account_contacts do |t|
        t.change :primary_phone, :integer
        t.change :secondary_phone, :integer
      end
    end
end
