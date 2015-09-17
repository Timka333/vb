class Invoices < ActiveRecord::Migration
  def change
  	create_table :invoices do |t|
      t.string :rep
      t.string :date
      t.string :quote
      t.string :po_number
      t.string :invoice_number
      t.string :side_mark

      t.string :sold
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :phone
      t.string :fax

      t.string :ship_address
      t.string :ship_city
      t.string :ship_zipcode
      t.string :ship_phone
      t.string :ship_fax
	
      t.string :quantity
      t.string :manu
      t.string :item_number
      t.string :description
      t.string :unit_price
      t.string :description

      t.timestamps
    end
  end
end
