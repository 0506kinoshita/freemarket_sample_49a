require "csv"

CSV.foreach('db/category_table_data.csv') do |row|
  Category.create(name: row[0], parent_id: row[1])
end
