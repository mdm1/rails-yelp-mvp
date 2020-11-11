class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true
  validates :rating, presence: true, numericality: { greater_than: -1, less_than_or_equal_to: 5 }
end
