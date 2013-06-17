require 'spec_helper'

describe Item do
  it "should have a description" do
    item = Item.new(:description => "")
    item.should_not be_valid
  end
  
  it "should have a price" do
    item = Item.new(:price => "")
    item.should_not be_valid
  end
  
  it "should have a price greater than 0" do
    item = Item.new(:price => "0")
    item.should_not be_valid
  end
end