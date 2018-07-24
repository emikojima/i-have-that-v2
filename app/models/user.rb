class User < ApplicationRecord
  has_secure_password

  has_many :items
  has_many :reviews, through: :items
  validates :name, uniqueness: true
  validates :email, uniqueness: true

  accepts_nested_attributes_for :items
  # geocoded_by :address
  # after_validation :geocode, if: => :address_changed?
  # after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def address
  [street, city, state, country].compact.join(', ')
  end
end
