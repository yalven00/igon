class CreateAccountUsersSkillsJoin < ActiveRecord::Migration

  def up
    create_table :account_users_skills, :id => false do |t|
      t.integer "account_user_id"
      t.integer "skill_id"
    end
    # add_index :account_users_skills, ["account_user_id", "skill_id"]
  end

  def down
    drop_table :account_users_skills
  end

end
