class ActsAsCommentableWithThreadingMigration < ActiveRecord::Migration
  def self.up
    create_table :comments, :force => true do |t|
      t.integer :commentable_id, :default => 0
      t.string :commentable_type, :default => ""
      t.string :title, :default => ""
      t.text :body, :default => ""
      t.string :subject, :default => ""
      t.integer :account_user_id, :default => 0, :null => false
      t.integer :parent_id, :lft, :rgt
      t.boolean :public, :default => false
      t.boolean :seen_by_user
      t.integer :order_number
      t.timestamps
    end

    add_index :comments, :account_user_id
    add_index :comments, :commentable_id
  end

  def self.down
    drop_table :comments
  end
end
