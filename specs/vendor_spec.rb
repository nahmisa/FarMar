require_relative './spec_helper'

describe FarMar::Vendor do
  it "is an object we have access to" do
    FarMar::Vendor.wont_be_nil
  end

  describe "FarMar::Vendor#all" do
    it "returns an array of instances" do
    FarMar::Vendor.all.must_be_kind_of(Array)
    end
  end

  describe "FarMar::Vendor#find" do
    it "can find a product instance based on ID" do
    #we have Vendor IDs 1-2690, and will test at random!
    id = (1..2690).to_a.sample
    FarMar::Vendor.find(id).must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "FarMar::Vendor#market" do
    it "returns a collection of FarMar::Market instances that are associated with the vendor by the market_id field." do
    #we have Market IDs 1-500, and will test at random!
    market_id = (1..500).to_a.sample
    test_vendor = FarMar::Vendor.new( market_id: market_id )
    markets_collection = test_vendor.markets
    markets_collection.must_be_kind_of(Array)

    #any item in the Array will be an instance of FarMar::Market
    number_of_markets = markets_collection.length
    random_market = (0...number_of_markets).to_a.sample
    markets_collection[random_market].must_be_instance_of(FarMar::Market)
    end
  end

end
