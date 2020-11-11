class CategoryValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless ["Chinese", "Italian", "Japanese", "French", "Belgian"].include?(value)
      record.errors[attribute] << (options[:message] || "is invalid")
    end
  end
end

class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
  validates :category, presence: true, category: true
end
