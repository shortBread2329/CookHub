class Procedure < ApplicationRecord
  belongs_to :post_recipe
  has_many :ingredients
  has_many :amounts
  has_many :units
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: lambda { |attributes| attributes[:name].blank? && attributes[:amount].blank? }
end
