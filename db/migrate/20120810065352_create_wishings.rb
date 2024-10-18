class CreateWishings < ActiveRecord::Migration

  def change
    create_table :wishings do |t|
      t.integer :account_user_id
      t.integer :community_id
      t.integer :product_id
      t.timestamps
    end
    # add_index :community_memberships, [:account_user_id, :community_id, :product_id]
  end

  def self.down
    drop_table :products
  end

end