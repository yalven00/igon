class ChangeAccountUsersPassAndSaltLimit < ActiveRecord::Migration
  def up
    change_column :account_users, :hashed_password, :string, :limit => 65
    change_column :account_users, :salt, :string, :limit => 65
  end

  def down
    change_column :account_users, :hashed_password, :text, :limit => 40
    change_column :account_users, :salt, :string, :limit => 40
  end
end
