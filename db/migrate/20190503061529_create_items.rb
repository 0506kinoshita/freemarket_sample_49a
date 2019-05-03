class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string   :name, null: false
      t.integer  :price, null: false
      t.text     :detail, null: false
      t.text     :image, null: false
      t.string   :size, null: false
      t.string   :condition
      t.string   :shipment_day, null: false
      t.string   :delivery_fee, null: false
      t.string   :prefecture, null: false
      t.timestamps null: true
    end
  end
end
