class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :zip_code,          null: false
      t.string :prefecture,         null: false
      t.string :city,               null: false
      t.text :block_number,         null: false
      t.text :building_name
      t.integer :homephone_number
      t.references :user,           foreign_key: true
      
      t.timestamps
    end
  end
end
