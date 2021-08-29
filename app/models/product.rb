class Product < ApplicationRecord
  has_many :variants

  def self.create_many products
    valid_products = products.select {|product| self.is_valid?(product)}.map {|product| {
      name: product['name'],
      description: product['description'],
      variants: product['variants'].select {|variant| Variant.is_valid?(variant)}
    }}

    return unless valid_products.length > 0

    products = Product.insert_all(valid_products.map {|product| { 
      name: product[:name], 
      description: product[:description], 
      created_at: DateTime.now,
      updated_at: DateTime.now
    }}).rows.flatten

    Variant.insert_all(valid_products.each_with_index.map {|vp, i| vp[:variants].map {|variant| { 
      name: variant['name'], 
      price: variant['price'],
      product_id: products[i],
      created_at: DateTime.now,
      updated_at: DateTime.now
    }}}.flatten)
  end

  def self.is_valid? product
    !product['name'].blank? and 
      !product['description'].blank? and 
      (product['variants'] || []).select {|variant| Variant.is_valid?(variant)}.length > 0
  end
end
