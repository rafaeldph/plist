class Product < ApplicationRecord
  has_many :variants

  def self.create_many products
    products.select {|product| self.is_valid?(product)}.each do |object|
      product = Product.create(name: object['name'], description: object['description'])
      Variant.create_many(product.id, object['variants'])
    end
  end

  def self.is_valid? product
    !product['name'].blank? and 
      !product['description'].blank? and 
      (product['variants'] || []).select {|variant| !variant['name'].blank? and variant['price'] > 0}.length > 0
  end
end
