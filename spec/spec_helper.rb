require 'aether'

require 'hashie'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end


### Helper Methods

def chef_server_info
 @chef_server_info ||=  YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), 'chef_server.yml'))).symbolize_keys
end

def mock_node
  @mock_node ||= Hashie::Mash.new(
    :name => 'web01.staging.foo.com',
    :attributes => {
      :automatic => {
        :fqdn => 'web01.staging.foo.com',
        :ipaddress => '10.0.10.15'
      }
    }
  )
end
