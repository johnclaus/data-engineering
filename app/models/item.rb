class Item < ActiveRecord::Base
  belongs_to :merchant
  validates :merchant_id, presence: true
  
  validates :price, presence: true
  validates_numericality_of :price, :greater_than => 0
  
  validates :description, uniqueness: true, presence: true
end