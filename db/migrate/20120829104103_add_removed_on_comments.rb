class AddRemovedOnComments < ActiveRecord::Migration
  def up
    add_column("comments","removed", :boolean, :default => false)
  end

  def down
    remove_column("comments","removed")
  end
end
