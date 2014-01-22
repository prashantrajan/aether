require 'spec_helper'

describe Aether::DataBagItem do
  let(:data_bag_item) { Aether::DataBagItem.new(mock_data_bag_item) }

  describe "#attributes" do
    it "returns the data bag item attributes" do
      expect(data_bag_item.attributes.primary_hostname.integration).to eq(mock_data_bag_item.attributes.primary_hostname.integration)
    end
  end
end
