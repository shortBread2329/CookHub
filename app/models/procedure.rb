class Procedure < ApplicationRecord
  belongs_to :post_recipe
  has_many :post_ingredients 
end
