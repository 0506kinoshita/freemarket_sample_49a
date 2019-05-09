class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :items_like, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to:category
  has_many :ordered_items

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  # belongs_to :user
  # belongs_to :brand
end
