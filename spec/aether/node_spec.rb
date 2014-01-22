require 'spec_helper'

describe Aether::Node do
  let(:node) { Aether::Node.new(mock_node) }

  describe "#ipaddress" do
    it "returns the ip address" do
      expect(node.ipaddress).to_not be_blank
      expect(node.ipaddress).to eq(mock_node.chef_attributes.ipaddress)
    end
  end

  describe "#local_ipv4" do
    it "returns the ip address" do
      expect(node.local_ipv4).to_not be_blank
      expect(node.local_ipv4).to eq(mock_node.chef_attributes.ipaddress)
    end
  end

  describe "#hostname" do
    it "returns the fqdn" do
      expect(node.hostname).to_not be_blank
      expect(node.hostname).to eq(mock_node.chef_attributes.fqdn)
    end
  end

  describe "#fqdn" do
    it "returns the fqdn" do
      expect(node.fqdn).to_not be_blank
      expect(node.fqdn).to eq(mock_node.chef_attributes.fqdn)
    end
  end
end
