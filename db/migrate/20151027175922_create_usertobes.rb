class CreateUsertobes < ActiveRecord::Migration
  def change
    create_table :usertobes do |t|
      t.string :email

      t.timestamps
    end
  end
end
