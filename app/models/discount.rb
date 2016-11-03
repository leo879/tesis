class Discount < ActiveRecord::Base
  belongs_to :society
  belongs_to :category
  belongs_to :user

  accepts_nested_attributes_for :category, reject_if: :all_blank,allow_destroy: true

end
