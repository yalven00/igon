class CreateNeeds < ActiveRecord::Migration

  def self.up
    create_table :needs do |t|
      t.string "name", :limit => 255
      t.boolean "good"
      t.timestamps
    end
  end

  def self.down
    drop_table :needs
  end

end
