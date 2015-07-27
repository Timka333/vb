class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :client_type

      t.timestamps
    end
  end
end
