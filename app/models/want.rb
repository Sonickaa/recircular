class Want < ApplicationRecord
  belong_to :user
  has_many :products
end
