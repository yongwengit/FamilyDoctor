class AddCategoryToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :category, :integer
  end
end
