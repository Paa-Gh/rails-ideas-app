class Category < ApplicationRecord
  has_many :ideas
  validates :name, presence:true
  validates :name, length: { in: 4..20 }
end
