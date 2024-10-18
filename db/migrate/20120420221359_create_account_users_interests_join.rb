class CreateAccountUsersInterestsJoin < ActiveRecord::Migration

  def up
    create_table :account_users_interests, :id => false do |t|
      t.integer "account_user_id"
      t.integer "interest_id"
    end
    # add_index :account_users_interests, ["account_user_id", "interest_id"]
  end

  def down
    drop_table :account_users_interests
  end

end
