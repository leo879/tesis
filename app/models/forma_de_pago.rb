class FormaDePago < ActiveRecord::Base
  has_many :receipts
  belongs_to :user
end
