class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :title
      t.text :text
      t.integer :authorId
      t.date :startTime
      t.date :endTime
      t.date :createTime
      t.integer :category
      t.integer :privilege

      t.timestamps
    end
  end
end
