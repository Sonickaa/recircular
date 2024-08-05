class UserCategory < ApplicationRecord
  has_many :categories
  belongs_to :users
end
