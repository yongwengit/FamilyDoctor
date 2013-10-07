class RemoveTypeFromExperience < ActiveRecord::Migration
  def up
    remove_column :experiences, :type
  end

  def down
    add_column :experiences, :type, :interge
  end
end
