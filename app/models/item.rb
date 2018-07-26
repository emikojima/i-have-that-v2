class Item < ApplicationRecord
  has_many :reviews
  belongs_to :user
  belongs_to :category, optional: true
  default_scope -> { order('created_at DESC') }
  validates :name, presence: true

  def self.find_location
    binding.pry
  end
end
