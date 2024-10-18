class CreateAccountUsersNeedsJoin < ActiveRecord::Migration

  def up
    create_table :account_users_needs, :id => false do |t|
      t.integer "account_user_id"
      t.integer "need_id"
    end
    # add_index :account_users_needs, ["account_user_id", "need_id"]
  end

  def down
    drop_table :account_users_needs
  end

end