class Variant < ApplicationRecord
  belongs_to :product

  def self.is_valid? variant
    !variant['name'].blank? and variant['price'] > 0
  end
end
