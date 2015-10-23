class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.string :title
      t.integer :user_id, :proj_id
      t.string :descrip

      t.timestamps
    end

	create_table :todolistitems do |t|
      t.belongs_to :todolists, index: true
      t.string :title
      t.integer :user_id, :proj_id
      t.boolean :finished

    end

  end
end
