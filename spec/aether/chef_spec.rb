require 'spec_helper'

describe Aether::Chef do
  # TODO: mock the response; right now the tests connect to a real chef server :p

  describe "#new" do
    let(:chef_server) { Aether::Chef.new(chef_server_info) }

    it "sets the connection" do
      expect(chef_server.connection).to be_an_instance_of(Ridley::Connection)
    end

    it "sets the environment" do
      expect(chef_server.environment).to eq('staging')
    end
  end

  describe "#find_servers" do
    let(:chef_server) { Aether::Chef.new(chef_server_info) }

    it "returns an array of Chef::Server" do
      results = chef_server.find_servers(:role => 'web-server')
      expect(results).to be_an_instance_of(Array)
      expect(results.first).to be_an_instance_of(Aether::Server)
    end
  end

end
