class CreateProductShops < ActiveRecord::Migration
  def change
    create_table :product_shops do |t|
      t.references :shop
      t.references :product
      t.float :price

      t.timestamps
    end
    add_index :product_shops, :shop_id
    add_index :product_shops, :product_id
  end
end
