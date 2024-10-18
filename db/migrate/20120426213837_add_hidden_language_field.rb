class AddHiddenLanguageField < ActiveRecord::Migration
  def up
    add_column("languages","hidden", :boolean, :default => false)
  end

  def down
    add_column("languages","hidden")
  end
end
