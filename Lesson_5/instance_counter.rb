module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instaces
    def instances
      @instances
    end
  end

  module InstanceMethods
    self.class.instances = 0

    protected

    def register_instance
      self.class.instances += 1
    end
  end
end
