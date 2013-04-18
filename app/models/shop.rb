class Shop < ActiveRecord::Base
  attr_accessible :address, :logo, :name, :password, :usama
  has_many :product_shops
  has_many :products, :through => :product_shops
end
