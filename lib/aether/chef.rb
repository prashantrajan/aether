module Aether
  class Chef

    attr_reader :connection, :environment

    def initialize(opts = {})
      @connection = Ridley.new(
        server_url: opts[:server_url],
        client_name: opts[:client_name],
        client_key: opts[:client_key]
      )

      @environment = opts[:environment]
    end

    def find_nodes(options = {}, include_environment = true)
      roles = options[:roles] || []
      results = []

      search_str = build_search_query(:include_environment => include_environment, :roles => roles)
      connection.search(:node, search_str).each do |node|
        results << Aether::Node.new(node)
      end

      results
    end

    def find_data_bag_item(bag_name, item_name)
      data_bag_item = connection.data_bag.all.find{ |bag| bag.name == bag_name }.item.find(item_name)
      Aether::DataBagItem.new(data_bag_item)
    end

    def build_search_query(options = {})
      include_environment = options[:include_environment]
      roles = options[:roles] || []

      str = ''
      str << "chef_environment:#{environment}" if include_environment
      unless roles.empty?
        str << " AND " if include_environment
        str << build_search_roles_query(roles)
      end

      str
    end


    private

    def build_search_roles_query(roles)
      str = ''

      last_index = roles.size - 1
      roles.each_with_index do |role, i|
        if i == last_index
          str << "role:#{role}"
        else
          if roles.size == 1
            str << "role:#{role}"
          else
            str << "role:#{role} AND "
          end
        end
      end

      str
    end

  end
end
