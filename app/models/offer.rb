class Offer < ApplicationRecord
  belongs_to :users
  has_many :offer_lists
end
