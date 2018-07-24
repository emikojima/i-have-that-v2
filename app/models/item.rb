class Item < ApplicationRecord
  has_many :reviews
  belongs_to :user
  belongs_to :category, optional: true
end
