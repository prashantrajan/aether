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

  describe "#build_search_query" do
    let(:chef_server) { Aether::Chef.new(chef_server_info) }

    context "with env and 1 role" do
      it "returns an appropriate search query" do
        results = chef_server.build_search_query(:include_environment => true, :roles => ['web-server'])
        expect(results).to eq("chef_environment:#{chef_server.environment} AND role:web-server")
      end
    end

    context "with env and 2 roles" do
      it "returns an appropriate search query" do
        results = chef_server.build_search_query(:include_environment => true, :roles => ['web-server', 'worker-server'])
        expect(results).to eq("chef_environment:#{chef_server.environment} AND role:web-server AND role:worker-server")
      end
    end

    context "without env and 1 role" do
      it "returns an appropriate search query" do
        results = chef_server.build_search_query(:include_environment => false, :roles => ['web-server'])
        expect(results).to eq("role:web-server")
      end
    end

    context "without env and more than one role" do
      it "returns an appropriate search query" do
        results = chef_server.build_search_query(:include_environment => false, :roles => ['web-server', 'push-server', 'worker-server'])
        expect(results).to eq("role:web-server AND role:push-server AND role:worker-server")
      end
    end
  end

  describe "#find_nodes" do
    let(:chef_server) { Aether::Chef.new(chef_server_info) }

    it "returns an array of Chef::Server" do
      results = chef_server.find_nodes(:roles => ['web-server'])
      expect(results).to be_an_instance_of(Array)
      expect(results.first).to be_an_instance_of(Aether::Node)
    end
  end

end
