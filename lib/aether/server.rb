module Aether
  class Server

    attr_reader :name, :attributes, :raw

    def initialize(options = {})
      node = options[:node]
      @name = node.name
      @attributes = node.attributes
      @raw = node
    end

    def ipaddress
      @ipaddress ||= attributes[:automatic][:ipaddress]
    end

    def hostname
      @hostname ||= attributes[:automatic][:fqdn]
    end

  end
end
