require 'spec_helper'

describe Aether::Server do
  let(:server) { Aether::Server.new(:node => mock_node_results) }

  describe "#ipaddress" do
    it "returns the ip address" do
      expect(server.ipaddress).to_not be_blank
      expect(server.ipaddress).to eq(mock_node_results.attributes.automatic.ipaddress)
    end
  end

  describe "#hostname" do
    it "returns the fqdn" do
      expect(server.hostname).to_not be_blank
      expect(server.hostname).to eq(mock_node_results.attributes.automatic.fqdn)
    end
  end

end
