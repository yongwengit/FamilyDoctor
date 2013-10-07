class RemoveColumnFromComment < ActiveRecord::Migration
  def up
    remove_column :comments, :autorId
  end

  def down
    add_column :comments, :autorId, :integer
  end
end
