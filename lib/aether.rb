require 'aether/version'
require 'ridley'


module Aether
 class Chef

   attr_reader :connection, :environment

   def initialize(options = {})
     @connection = Ridley::Connection.new(
       :server_url => options[:server_url],
       :client_name => options[:client_name],
       :client_key => options[:client_key],
       :organization => options[:organization]
     )

     @environment = options[:environment]
   end

   def find_servers(options)
     role = options[:role]
     connection.search(:node, "chef_environment:#{environment} AND role:#{role}")
   end

   def find_web_servers(role = 'web-server')
     @web_servers ||= find_servers(:role => role)
   end

   def find_db_migration_server(role = 'db-migration-server')
     @db_migration_server ||= find_servers(:role => role).first
   end

   def find_data_bag_item(bag_name, item_name)
     @data_bag_item ||= connection.data_bag.all.find{ |bag| bag.name == bag_name }.item.find(item_name).attributes
   end

 end
end
