class AddRepliesOnComments < ActiveRecord::Migration
  def up
    add_column("comments","replies", :integer, :default => 0)
  end

  def down
    remove_column("comments","replies")
  end
end
