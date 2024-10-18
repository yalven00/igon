class CreateImages < ActiveRecord::Migration

  def change
    create_table :images do |t|
      t.string :name
      t.string :caption
      t.integer :imageable_id
      t.string  :imageable_type
      t.string :image
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end

end