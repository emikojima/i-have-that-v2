class Item < ApplicationRecord
  has_many :reviews
  belongs_to :user
  belongs_to :category, optional: true
  default_scope -> { order('name ASC') }
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
end
