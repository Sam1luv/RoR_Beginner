module Validation
  def self.included(reciever)
    reciever.extend ClassMethods
    reciever.send :include, InstanceMethods
  end
  
  attr_accessor :validation

  
  module ClassMethods
    def validate(name, type, *args)
      validation || = []
      validation << {attr_name: name, validate_type: type, args: args}  
    end
  end

  module InstanceMethods
    def validate!
      self.class.validation.each do |params|

      end 
    end

    def valid?
    end
    
    protected

    def presence(name)
      raise "Wrong attr - @#{name} value" if instance_variable_get("@#{name}").to_s.empty?
    end

    def format(name, regexp)
      raise "Wrong attr - @#{name} format" if instance_variable_get("@#{name}") !~ regexp
    end

    def type(name, attr_cls)
      raise "Wrong attribute claas" unless instance_variable_get("@#{name}").is_a?(attr_cls)
    end 
  end
end
