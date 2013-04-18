class ProductShopsController < ApplicationController
  def index
    shop = Shop.find(params[:shop_id])

    @products = shop.products

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end


  def new
    shop = Shop.find(params[:shop_id])

    @name = shop.name
    @shop_product = ProductShop.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop_product }
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = ProductShop.new(params[:product_shop])


    respond_to do |format|
      if @product.save
        format.html { redirect_to shop_product_shops_path, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

end
