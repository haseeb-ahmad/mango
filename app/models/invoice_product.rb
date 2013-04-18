class InvoiceProduct < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :product
  attr_accessible :invoice_id,:product_id
end
