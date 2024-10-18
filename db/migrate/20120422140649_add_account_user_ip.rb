class AddAccountUserIp < ActiveRecord::Migration
  def up
    add_column("account_users","ip", :string, :limit => 25)
  end

  def down
    remove_column("account_users","ip")
  end
end
