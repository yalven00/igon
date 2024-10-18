class CreateCommunityMemberships < ActiveRecord::Migration

  def change
    create_table :community_memberships do |t|
      t.integer :account_user_id
      t.integer :community_id
      t.boolean :approved, :default => false
      t.timestamps
    end
    # add_index :community_memberships, [:account_user_id, :community_id]
  end

  def self.down
    drop_table :community_memberships
  end

end