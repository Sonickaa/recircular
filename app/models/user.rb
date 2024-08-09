class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :categories, dependent: :destroy, through: :user_categories
  has_many :favorites, dependent: :destroy
  has_many :wants, dependent: :destroy
  has_many :products, dependent: :destroy
end
