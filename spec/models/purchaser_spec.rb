require 'spec_helper'

describe Purchaser do
  it "should have a name" do
    purchaser = Purchaser.new(:name => "")
    purchaser.valid?
    purchaser.should have(1).error_on(:name)
  end
  
  it "should have a unique name" do
    Purchaser.create!(:name=>"The Duke of NYC")
    purchaser = Purchaser.new(:name=>"The Duke of NYC")
    purchaser.should_not be_valid
  end
end