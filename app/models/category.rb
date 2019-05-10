class Category < ApplicationRecord
  has_many :items
  belongs_to :parent, class_name: :Category, optional: true
  has_many :children, class_name: :Category, foreign_key: :parent_id

  def self.get_category_items(id)
    category = Category.find(id)
    categories = [
      category,
      category.children,
      category.children.map { |category| category.children }
    ].flatten.compact
    categories.map { |category| category.items }.flatten.sort_by{|i| i.created_at}.reverse
  end

  scope :skim, -> (type) { get_category_items(type).first(4)}

end
