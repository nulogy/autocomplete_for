require 'rails_helper'
require 'spec_helper'
require_relative '../lib/autocomplete_for'

RSpec.describe "autocomplete_for" do
  before do
    Vendor.destroy_all
    Customer.destroy_all
  end

  let(:autocomplete_for_customer) { AutoCompleteForCustomerTestModel.new }
  let(:autocomplete_for_vendor) { AutoCompleteForVendorTestModel.new }
  let(:customer) { Customer.create! :name => "Customer Name", :code => "Customer Code" }
  let(:vendor_nil_code) { Vendor.create! :name => "Nil Code" }
  let(:vendor) { Vendor.create! :name => "Vendor Name", :code => "Vendor Code" }

  it "with valid name" do
    autocomplete_for_vendor.update_attributes! :vendor_name => vendor.name 

    expect(autocomplete_for_vendor.vendor).to eq(vendor)
  end
  
  it "with invalid name" do
    autocomplete_for_vendor.update_attributes :vendor_name => "Not a Vendor Name"

    expect(autocomplete_for_vendor.vendor).to eq(nil)
    expect(autocomplete_for_vendor.errors[:vendor_name]).to be_present
    expect(autocomplete_for_vendor.errors[:vendor_code]).to be_empty
    expect(autocomplete_for_vendor.errors[:vendor]).to be_empty
  end

  it "with blank name" do
    autocomplete_for_vendor.update_attributes :vendor_name => ""

    expect(autocomplete_for_vendor.vendor).to eq(nil)
    expect(autocomplete_for_vendor.errors[:vendor_name]).to be_present
    expect(autocomplete_for_vendor.errors[:vendor_code]).to be_empty
    expect(autocomplete_for_vendor.errors[:vendor]).to be_empty
  end

  it "with nil name" do
    autocomplete_for_vendor.update_attributes :vendor_name => nil

    expect(autocomplete_for_vendor.vendor).to eq(nil)
    expect(autocomplete_for_vendor.errors[:vendor].size).to eq(1)
    expect(autocomplete_for_vendor.errors[:vendor_code]).to be_empty
    expect(autocomplete_for_vendor.errors[:vendor_name]).to be_empty
  end

  it "should clear existing association" do
    autocomplete_for_vendor.update_attributes! :vendor => vendor
    expect(autocomplete_for_vendor.vendor).to eq(vendor)

    autocomplete_for_vendor.update_attributes :vendor_name => ""
    expect(autocomplete_for_vendor.vendor).to eq(nil)
    expect(autocomplete_for_vendor.errors[:vendor_name]).to be_present

    expect(autocomplete_for_vendor.errors[:vendor_code]).to be_empty
    expect(autocomplete_for_vendor.errors[:vendor]).to be_empty
  end

  it "should not clear existing association" do
    autocomplete_for_vendor.update_attributes! :vendor => vendor
    expect(autocomplete_for_vendor.vendor).to eq(vendor)

    autocomplete_for_vendor.update_attributes! :vendor_name => nil
    expect(autocomplete_for_vendor.vendor).to eq(vendor)
  end

  it "should clear existing association using field that can be nil" do
    autocomplete_for_vendor.update_attributes! :vendor => vendor
    expect(autocomplete_for_vendor.vendor).to eq(vendor)

    autocomplete_for_vendor.update_attributes :vendor_code => ""
    expect(autocomplete_for_vendor.vendor).to eq(nil)
    expect(autocomplete_for_vendor.errors[:vendor_code]).to be_present

    expect(autocomplete_for_vendor.errors[:vendor_name]).to be_empty
    expect(autocomplete_for_vendor.errors[:vendor]).to be_empty
  end

  it "allow_nil with valid name" do
    autocomplete_for_customer.update_attributes! :customer_name => customer.name 

    expect(autocomplete_for_customer.customer).to eq(customer)
  end
  
  it "allow_nil with invalid name" do
    autocomplete_for_customer.update_attributes :customer_name => "Not A Customer Name" 

    expect(autocomplete_for_customer.customer).to eq(nil)
    expect(autocomplete_for_customer.errors[:customer_name]).to be_present
    expect(autocomplete_for_customer.errors[:customer_code]).to be_empty
    expect(autocomplete_for_customer.errors[:customer]).to be_empty
  end

  it "allow_nil with blank name" do
    autocomplete_for_customer.update_attributes! :customer_name => "" 

    expect(autocomplete_for_customer.customer).to eq(nil)
  end

  it "allow_nil with nil name" do
    autocomplete_for_customer.update_attributes! :customer_name => nil 

    expect(autocomplete_for_customer.customer).to eq(nil)
  end

  it "allow_nil should clear existing association" do
    autocomplete_for_customer.update_attributes! :customer => customer
    expect(autocomplete_for_customer.customer).to eq(customer)

    autocomplete_for_customer.update_attributes! :customer_name => ""
    expect(autocomplete_for_customer.customer).to eq(nil)
  end

  it "allow_nil should not clear existing association" do
    autocomplete_for_customer.update_attributes! :customer => customer
    expect(autocomplete_for_customer.customer).to eq(customer)

    autocomplete_for_customer.update_attributes! :customer_name => nil
    expect(autocomplete_for_customer.customer).to eq(customer)
  end

  class Vendor < ActiveRecord::Base; end
  class Customer < ActiveRecord::Base; end

  class AutoCompleteForCustomerTestModel < ActiveRecord::Base
    belongs_to :customer

    autocomplete_for :customer, :name, :allow_nil => true do
      self.customer = Customer.where(name: customer_name).first
    end
    autocomplete_for :customer, :code, :allow_nil => true do
      self.customer = Customer.where(code: customer_code).first
    end
  end

  class AutoCompleteForVendorTestModel < ActiveRecord::Base
    belongs_to :vendor

    autocomplete_for :vendor, :name do
      self.vendor = Vendor.where(name: vendor_name).first
    end
    autocomplete_for :vendor, :code do
      self.vendor = Vendor.where(code: vendor_code).first
    end
  end
end
