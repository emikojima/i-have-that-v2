class User < ApplicationRecord
  has_secure_password

  has_many :items
  has_many :categories, through: :items
  validates :name, presence: true, uniqueness: true, case_sensitive: false
  validates :email, presence: true, uniqueness: true
  validates :city, presence: true
  validates :state, presence: true
  default_scope -> { order('name ASC') }

  accepts_nested_attributes_for :items
  # geocoded_by :address
  # after_validation :geocode, if: => :address_changed?
  # after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def address
  [street, city, state, country].compact.join(', ')
  end

  def downcase
    self.name.downcase
  end

end
