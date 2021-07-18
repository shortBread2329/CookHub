class Ingredient < ApplicationRecord
  belongs_to :post_ingredient, optional: true
  has_many :ingredients
  has_many :amounts
  has_many :units

end
