class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many :chats , ->(user) { unscope(where: :user_id).where("user_sender_id = ? OR user_receiver_id = ?", user.id, user.id) }, class_name: 'Chat', dependent: :destroy
  has_many :offers, ->(user) { unscope(where: :user_id).where("user_sender_id = ? OR user_receiver_id = ?", user.id, user.id) }, class_name: 'Offer', dependent: :destroy

  has_many :user_categories
  has_many :categories, through: :user_categories, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :wants, dependent: :destroy
  has_many :products, dependent: :destroy

  after_save :assign_profile

  def assign_profile
    UserProfile.create!(user_id: self.id, first_name: self.email.gsub(/@.*/, "") )
  end

end
