class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def show
  end

  def create
    products = JSON.parse(request.body.read)
    
    ApiLog.create(quantity: products.length)

    return render json: { success: false }, status: :payload_too_large unless products.length <= 10000
    
    Product.create_many(products)
    render json: { success: true }, status: :created
  end
end
