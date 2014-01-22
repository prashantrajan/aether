require 'ridley'
# don't output Celluloid logs (see: https://github.com/RiotGames/ridley/issues/220)
Ridley::Logging.logger.level = Logger::ERROR

require 'aether/version'
require 'aether/node'
require 'aether/data_bag_item'
require 'aether/chef'
