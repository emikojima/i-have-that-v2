class Category < ApplicationRecord
  has_many :items
  has_many :users, through: :items
  default_scope -> { order('name ASC') }
  validates :name, presence: true
end
