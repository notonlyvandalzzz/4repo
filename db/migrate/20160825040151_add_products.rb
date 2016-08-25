class AddProducts < ActiveRecord::Migration
  def change
  	Product.create 
  		:title => 'Гавайская', 
  		:desc => 'Нежная пицца с курицей и кусочками ананасов', 
  		:size => 'large', 
  		:price => '430',
  		:is_spicy => false,
  		:is_veget => false,
  		:is_halal => true,
  		:path_to_pic => '/images/hawaiian.jpg'

  	Product.create 
  		:title => 'Хрустящая', 
  		:desc => 'Хрустящая пицца с грибами и рукколой', 
  		:size => 'medium', 
  		:price => '390',
  		:is_spicy => false,
  		:is_veget => true,
  		:is_halal => false,
  		:path_to_pic => '/images/crusty.png'

  	Product.create 
  		:title => 'Вегетарианская', 
  		:desc => 'Овощная пряная пицца', 
  		:size => 'medium', 
  		:price => '370',
  		:is_spicy => true,
  		:is_veget => true,
  		:is_halal => true,
  		:path_to_pic => '/images/veggie.png'

  	  	Product.create 
  		:title => 'Пепперони', 
  		:desc => 'Классическая пицца пепперони с перцем', 
  		:size => 'large', 
  		:price => '450',
  		:is_spicy => true,
  		:is_veget => false,
  		:is_halal => false,
  		:path_to_pic => '/images/pepperoni.png'
  end
end
