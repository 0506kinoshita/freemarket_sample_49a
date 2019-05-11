class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :items_like, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :item_categories
  has_many :categories, through: :item_categories
  has_many :ordered_items

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  # belongs_to :brand
end
