class ProductShop < ActiveRecord::Base
  belongs_to :shop
  belongs_to :product
  attr_accessible :price,:product_id, :shop_id
end
