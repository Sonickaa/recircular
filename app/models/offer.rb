class Offer < ApplicationRecord
  belongs_to :user
  has_many :offer_lists
end
