class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :bar_code
      t.string :name

      t.timestamps
    end
  end
end
