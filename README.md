# Aether

Aether is a simple wrapper over the [Ridley Rubygem](http://rubygems.org/gems/ridley) that returns
server information from a Chef Server.

The `Aether::Chef` class is mainly used in Capistrano recipes.


## Disclaimer

This is a thin wrapper over the Ridley interface that adds some Node level convenience methods.


## Usage

    chef_server = Aether::Chef.new(:server_url => 'https://api.opscode.com/organizations/foo', :client_name => 'foo',
                    :client_key => '/path/to/.chef/foo.pem', :organization => 'foo', :environment => 'production')

    # search servers with a given roles in its top level run list
    servers = chef_server.find_nodes(:roles => ['role2', 'role2']) # returns an array of Aether::Node
    servers.first.hostname # => 'foo.bar.com'
