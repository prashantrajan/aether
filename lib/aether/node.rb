module Aether
  class Node

    attr_reader :name, :attributes, :raw

    def initialize(node)
      @name = node.name
      @attributes = node.attributes
      @raw = node
    end

    def ipaddress
      @ipaddress ||= attributes[:automatic][:ipaddress]
    end
    alias_method :local_ipv4, :ipaddress

    def hostname
      @hostname ||= attributes[:automatic][:fqdn]
    end
    alias_method :fqdn, :hostname

  end
end
