class CreateAccountUsersLanguagesJoin < ActiveRecord::Migration

  def up
    create_table :account_users_languages, :id => false do |t|
      t.integer "account_user_id"
      t.integer "language_id"
    end
    # add_index :account_users_languages, ["account_user_id", "language_id"]
  end

  def down
    drop_table :account_users_languages
  end

end
