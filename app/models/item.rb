class Item < ActiveRecord::Base
  validates :price, presence: true
  validates_numericality_of :price, :greater_than => 0
  validates_presence_of :description
end