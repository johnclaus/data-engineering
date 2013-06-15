require 'spec_helper'

describe Merchant do
  it "it should have a name" do
    merchant = Merchant.new(:name => "")
    merchant.should_not be_valid
  end
  
  it "is should have an address" do
    merchant = Merchant.new(:address => "")
    merchant.should_not be_valid
  end
end