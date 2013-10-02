class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :address
      t.string :gender
      t.date :birthDay
      t.string :QQ
      t.string :phone

      t.timestamps
    end
  end
end
