module Aether
  class Node

    attr_reader :name, :attributes

    def initialize(node)
      @name = node.name
      @attributes = node.chef_attributes
    end

    def ipaddress
      @ipaddress ||= attributes.ipaddress
    end
    alias_method :local_ipv4, :ipaddress

    def hostname
      @hostname ||= attributes.fqdn
    end
    alias_method :fqdn, :hostname

  end
end
