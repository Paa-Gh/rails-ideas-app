class Idea < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one_attached :picture
  validates :name, presence:true
end
