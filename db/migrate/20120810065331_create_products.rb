class CreateProducts < ActiveRecord::Migration

  def change
    create_table :products do |t|
      t.integer :account_user_id
      t.string :name
      t.string :description
      t.string :location
      t.decimal :price
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end

end