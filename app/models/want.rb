class Want < ApplicationRecord
  belong_to :users
  has_many :products
end
