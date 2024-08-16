class Offer < ApplicationRecord
  belongs_to :user, :foreign_key => :user_sender_id
  belongs_to :user, :foreign_key => :user_receiver_id
  has_many :offer_lists
end
