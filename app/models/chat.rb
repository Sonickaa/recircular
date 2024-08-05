class Chat < ApplicationRecord
  belongs_to :users
  has_many :messages
end
