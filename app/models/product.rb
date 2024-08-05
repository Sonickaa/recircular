class Product < ApplicationRecord
  belongs_to :users
  belongs_to :categories
  belongs_to :favorites
  belongs_to :wants
  belongs_to :offer_lists
end
