class Variant < ApplicationRecord
  belongs_to :product

  def self.create_many product_id, variants
    variants.select {|variant| self.is_valid?(variant)}.each do |object|
      Variant.create(product_id: product_id, name: object['name'], price: object['price'])
    end
  end

  def self.is_valid? variant
    !variant['name'].blank? and variant['price'] > 0
  end
end
