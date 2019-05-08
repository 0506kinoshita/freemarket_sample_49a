class Category < ApplicationRecord
  has_many :items
  belongs_to :parent, class_name: :Category, optional: true
  has_many :children, class_name: :Category, foreign_key: :parent_id

  def self.get_category_items(id)
    category = Category.find(id)
    categories = [
      category,
        # cat1
      category.children,
        # cat2
      category.children.map { |category| category.children }
        # cat3  mapでchildrenのchildrenを配列に入れる
    ].flatten.compact
          #配列の中の配列を親の配列にまとめる、一つにする nilを除く
          # cat1,cat2,cat3の配列ができる
    categories.map { |category| category.items }.flatten.sort_by{|i| i.created_at}.reverse
            # /cat1,cat2,cat3|からitemをmapで抽出する。作成順に並び替える。逆順にする
            # [新着順のcat1,cat2,cat3]
  end
end
