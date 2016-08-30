class CreateOrders < ActiveRecord::Migration
  def change
  	create_table :orders do |t|
  		t.text :name
  		t.text :address
  		t.text :phone
  		t.text :orders_list
  		t.text :grandtotal

  		t.timestamps
  	end
  end
end
