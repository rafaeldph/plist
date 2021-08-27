class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by_id(params[:id])

    return redirect_to root_path if @product.nil?

    @title = @product.name
  end

  def create
    products = JSON.parse(request.body.read)
    
    ApiLog.create(quantity: products.length)

    return render json: { success: false }, status: :payload_too_large unless products.length <= 10000
    
    Product.create_many(products)
    render json: { success: true }, status: :created
  end
end
