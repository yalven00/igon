class CreateNumberOfMembersEachMonths < ActiveRecord::Migration

  def change
    create_table :number_of_members_each_months do |t|
      t.integer :membership_id
      t.integer :number_of_members
      t.date :join_month
      t.timestamps
    end
    # add_index :community_memberships, [:membership_id]
  end

  def self.down
    drop_table :number_of_members_each_months
  end

end