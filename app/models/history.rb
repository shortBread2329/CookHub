class History < ApplicationRecord
  belongs_to :user
  belongs_to :post_recipe
end
