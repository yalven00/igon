class AddUserIp < ActiveRecord::Migration
  def up
    add_column("users","ip", :string, :limit => 25)
  end

  def down
    remove_column("users","ip")
  end
end
