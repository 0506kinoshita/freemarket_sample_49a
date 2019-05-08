class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :items_like, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to:category
  has_many :ordered_items

  # item単体での動作をチェックしたいので一旦コメントアウトします
  # belongs_to :user
  # belongs_to :brand
end
