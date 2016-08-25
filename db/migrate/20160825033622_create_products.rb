class CreateProducts < ActiveRecord::Migration
  def change
  	create_table :products do |t|
  		t.text :title
  		t.integer :price
  		t.text :size
  		t.text :desc
  		t.boolean :is_spicy
  		t.boolean :is_veget
  		t.boolean :is_halal
  		t.string :path_to_pic
  		t.timestamps
  	end
  end
end
