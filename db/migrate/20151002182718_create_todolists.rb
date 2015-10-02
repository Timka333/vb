class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.string :title
      t.integer :user_id
      t.string :descrip

      t.timestamps
    end
  end
end
