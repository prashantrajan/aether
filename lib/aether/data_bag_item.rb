module Aether
  class DataBagItem

    attr_reader :attributes

    def initialize(data_bag_item)
      @attributes = data_bag_item.attributes
    end

  end
end
