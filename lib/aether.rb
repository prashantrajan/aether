require 'ridley'
# don't output Celluloid messages (see: https://github.com/RiotGames/ridley/issues/220)
Ridley::Logging.logger.level = Logger::FATAL

require 'aether/version'
require 'aether/node'
require 'aether/data_bag_item'
require 'aether/chef'
