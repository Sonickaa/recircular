class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  # belongs_to :favorite
  # belongs_to :want
  # belongs_to :offer_list
end
