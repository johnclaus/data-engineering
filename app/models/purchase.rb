class Purchase < ActiveRecord::Base
  belongs_to :item
  belongs_to :purchaser

  validates_presence_of :purchaser_id, :item_id
  
  def price
    item.price
  end
end