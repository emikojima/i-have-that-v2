class Item < ApplicationRecord
  belongs_to :user
  belongs_to :review, optional: true
end
