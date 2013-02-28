# Aether

Aether is a simple wrapper over the [Ridley Rubygem](http://rubygems.org/gems/ridley) that returns
server information from a Hosted Chef Server.

The `Aether::Chef` class is mainly used in Capistrano recipes.


## Disclaimer

This was built when the Ridley interface was in flux and we needed a consistent way to access node attributes.
Ridley has since added most of the same node related methods so you should probably use Ridley directly.


## Usage

    chef_server = Aether::Chef.new(:server_url => 'https://api.opscode.com/organizations/foo', :client_name => 'foo',
                    :client_key => '/path/to/.chef/foo.pem', :organization => 'foo', :environment => 'production')

    # search servers with a given roles in its top level run list
    servers = chef_server.find_nodes(:roles => ['role2', 'role2']) # returns an array of Aether::Node
    servers.first.hostname # => 'foo.bar.com'
