class ProductShop < ActiveRecord::Base
  belongs_to :shop
  belongs_to :product
  attr_accessible :price,:product_id, :shop_id


  def self.get_shop_products (product_id, shop_id)
  	array = ProductShop.where("product_id = #{product_id} AND shop_id = #{shop_id}")
  end

end
