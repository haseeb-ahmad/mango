class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :logo
      t.string :password
      t.string :usama

      t.timestamps
    end
  end
end
