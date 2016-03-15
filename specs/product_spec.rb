require_relative './spec_helper'

describe FarMar::Product do
  #we have Product IDs 1-8193, and will test at random!
  let(:random_product_id) { ("1".."8193").to_a.sample }
  #we have Vendor IDs 1-2690, and will test at random
  let(:random_vendor_id) { ("1".."2690").to_a.sample }
  #Market IDs are 1-500, and will test at random.
  let(:random_market_id) { ("1".."500").to_a.sample }

  let(:product_by_vendor_id_test) { FarMar::Product.new( [nil, nil, random_vendor_id] ) }
  let(:product_by_product_id_test) { FarMar::Vendor.new( [random_product_id, nil, nil] ) }

  it "is an object we have access to" do
    FarMar::Product.wont_be_nil
  end

  describe "self.all" do
    it "returns an array of instances" do
    FarMar::Product.all.must_be_kind_of(Array)
    end
  end

  describe "self.find" do
    it "can find a product instance based on ID" do
    FarMar::Product.find(random_product_id).must_be_instance_of(FarMar::Product)
    end
  end

  describe "#vendor" do
    it "will return the FarMar::Vendor instance associated with this vendor using the FarMar::Product vendor_id" do
      product_by_vendor_id_test.vendor.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "#sales" do
    it "will return a collection of FarMar::Sale instances that are associated by the product_id field." do
      sales_collection = product_by_product_id_test.sales
      sales_collection.must_be_kind_of(Array)

      # any item in the Array will be an instance of FarMar::Sale
      number_of_sales = sales_collection.length
      random_sale = (0...number_of_sales).to_a.sample
      sales_collection[random_sale].must_be_instance_of(FarMar::Sale)
    end
  end

end
