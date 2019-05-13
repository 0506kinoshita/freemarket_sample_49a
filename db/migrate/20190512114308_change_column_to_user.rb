class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :last_name, :string, null: true
    change_column :users, :first_name, :string, null: true
    change_column :users, :last_name_kana, :string, null: true
    change_column :users, :first_name_kana, :string, null: true
    change_column :users, :birth_year, :string, null: true
    change_column :users, :birth_month, :string, null: true
    change_column :users, :birth_day, :string, null: true
  end

  def down
    change_column :users, :last_name, :string, null: false
    change_column :users, :first_name, :string, null: false
    change_column :users, :last_name_kana, :string, null: false
    change_column :users, :first_name_kana, :string, null: false
    change_column :users, :birth_year, :string, null: false
    change_column :users, :birth_month, :string, null: false
    change_column :users, :birth_day, :string, null: false
  end
end
