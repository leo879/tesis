class Category < ActiveRecord::Base
  has_many :discounts
  has_many :societies, through: :discounts
  has_many :courses
  belongs_to :user
end
