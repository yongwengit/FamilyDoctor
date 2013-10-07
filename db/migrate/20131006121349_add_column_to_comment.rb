class AddColumnToComment < ActiveRecord::Migration
  def change
    add_column :comments, :authorId, :integer
  end
end
