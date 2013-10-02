class RemoveQqFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :QQ
  end

  def down
    add_column :users, :QQ, :string
  end
end
