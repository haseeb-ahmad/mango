class InvoiceProductsController < ApplicationController
  def index
    invoice = Invoice.find(params[:invoice_id])

    @products = invoice.products

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def new
    invoice = Invoice.find(params[:invoice_id])

    @invoice_product = InvoiceProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice_product }
    end
  end
  def show

  end

  # POST /products
  # POST /products.json
  def create


    # find a product against incoming barcode
    # now link that product with incoming invoice ID
      # incoming barcode might not match with any product in our system


    @product = InvoiceProduct.new(params[:invoice_product])

    p = Product.find_by_bar_code(params[:bar_code])
    shop_id = params[:shop_id]
    array = ProductShop.get_shop_products(p.id, shop_id)

    if p
      @product.product_id= p.id
    end

    respond_to do |format|
      if !p.nil? and !
        array.empty? and @product.save
        format.html { redirect_to invoice_invoice_products_path, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created}
      else
        puts "******************error******************"
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
end
