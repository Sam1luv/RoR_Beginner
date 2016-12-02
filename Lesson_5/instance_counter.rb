module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end
  module ClassMethods
    def instances
      @@instances
    end
  end
  module InstanceMethods
    @@instances = 0
    def initialize
      @@instances += 1
    end

    def register_instance
      @@instances += 1
    end
  end
end
