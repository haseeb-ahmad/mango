class Product < ActiveRecord::Base
  attr_accessible :bar_code, :name
  has_many :product_shops
  has_many :shops, :through => :product_shops
  has_many :invoice_products
  has_many :invoices, :through => :invoice_products
end
