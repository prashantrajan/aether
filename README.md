Aether
======

Aether is a simple wrapper over the [Ridley Rubygem](http://rubygems.org/gems/ridley) that returns
server information from a Hosted Chef Server.

The `Ather::Chef` class is mainly used in Capistrano recipes.


Usage
-----

    chef_server = Ather::Chef.new(:server_url => 'https://api.opscode.com/organizations/foo', :client_name => 'foo',
                    :client_key => '/path/to/.chef/foo.pem', :organization => 'foo', :environment => 'production')

    webservers = chef_server.find_webservers # returns an array of Aether::Server
    webservers.first.hostname # => 'foo.bar.com'

    servers = chef_server.find_servers(:role => 'a-chef-role') # search servers with a given role in its top level run list
