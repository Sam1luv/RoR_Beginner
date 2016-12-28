module Validation
  def self.included(reciever)
    reciever.extend ClassMethods
    reciever.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(name, type, *args)
      @validations ||= []
      @validations << { type: type, name: name, args: args }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        send validation[:type], validation[:name], validation[:args]
      end
      true
    end

    def valid?
      validate!
    rescue
      false
    end

    protected

    def presence(name, *args)
      raise "Wrong attr - @#{name} value" if instance_variable_get("@#{name}").to_s.empty?
      true
    end

    def format(name, args)
      raise "Wrong attr - @#{name} format" if instance_variable_get("@#{name}") !~ args[0]
    end

    def type(name, args)
      raise 'Wrong attribute claas' unless instance_variable_get("@#{name}").is_a?(args[0])
    end
  end
end
