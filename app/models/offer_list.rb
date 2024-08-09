class OfferList < ApplicationRecord
  belongs_to :offer
  has_many :products
end
