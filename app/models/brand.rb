class Brand < ApplicationRecord
  has_many :items, dependent: :nullify
end
