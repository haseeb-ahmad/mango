class CreateInvoiceProducts < ActiveRecord::Migration
  def change
    create_table :invoice_products do |t|
      t.references :invoice
      t.references :product

      t.timestamps
    end
    add_index :invoice_products, :invoice_id
    add_index :invoice_products, :product_id
  end
end
