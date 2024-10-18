class CreateCommunities < ActiveRecord::Migration

  def change
    create_table :communities do |t|
      t.string :name
      t.text :description
      t.boolean :membership_dues
      t.integer :number_of_members
      t.date :year_established
      t.timestamps
    end
  end

  def self.down
    drop_table :communities
  end

end
