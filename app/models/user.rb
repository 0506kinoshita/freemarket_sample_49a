class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :address, dependent: :destroy
  has_one :creditcard, dependent: :destroy
  has_many :notices, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :like_high, dependent: :destroy
  has_many :like_middle, dependent: :destroy
  has_many :like_low, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
