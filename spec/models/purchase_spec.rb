require 'spec_helper'

describe Purchase do
  it "should have a name" do
    purchase = Purchase.new
    purchase.purchaser = nil
    purchase.should_not be_valid
  end

  it "should have an item" do
    purchase = Purchase.new
    purchase.item = nil
    purchase.should_not be_valid
  end
end