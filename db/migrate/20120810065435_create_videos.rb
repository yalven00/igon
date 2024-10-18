class CreateVideos < ActiveRecord::Migration

    def change
    create_table :videos do |t|
      t.string :name
      t.string :caption
      t.integer :videoable_id
      t.string  :videoable_type
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end

end