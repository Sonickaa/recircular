class OfferList < ApplicationRecord
  belongs_to :offers
  has_many :products
end
