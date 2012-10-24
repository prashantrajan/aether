Aether
======

Aether is a simple wrapper over the [Ridley Rubygem](http://rubygems.org/gems/ridley) that returns
server information from a Hosted Chef Server.

The `Ather::Chef` class is mainly used in Capistrano recipes.


Usage
-----

    chef_server = Ather::Chef.new(:server_url => 'https://api.opscode.com/organizations/foo', :client_name => 'foo',
                    :client_key => '/path/to/.chef/foo.pem', :organization => 'foo', :environment => 'production')

    # search servers with a given roles in its top level run list
    servers = chef_server.find_nodes(:roles => ['role2', 'role2']) # returns an array of Aether::Node
    servers.first.hostname # => 'foo.bar.com'
