class Invoice < ActiveRecord::Base
  attr_accessible :invoice_number
  has_many :invoice_products
  has_many :products, :through => :invoice_products

  alias_attribute :name, :invoice_number

end
