class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :autorId
      t.integer :experienceId
      t.text :content
      t.date :createTime

      t.timestamps
    end
  end
end
