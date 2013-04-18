# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130403124713) do

  create_table "invoice_products", :force => true do |t|
    t.integer  "invoice_id"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "invoice_products", ["invoice_id"], :name => "index_invoice_products_on_invoice_id"
  add_index "invoice_products", ["product_id"], :name => "index_invoice_products_on_product_id"

  create_table "invoices", :force => true do |t|
    t.string   "invoice_number"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "product_shops", :force => true do |t|
    t.integer  "shop_id"
    t.integer  "product_id"
    t.float    "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "product_shops", ["product_id"], :name => "index_product_shops_on_product_id"
  add_index "product_shops", ["shop_id"], :name => "index_product_shops_on_shop_id"

  create_table "products", :force => true do |t|
    t.string   "bar_code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shops", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "logo"
    t.string   "password"
    t.string   "usama"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
