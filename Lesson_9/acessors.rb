module Acessors
  module ClassMethods
    def attr_acessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        var_history = "@#{name}_history".to_sym
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}=") do |value|
          instance_variable_set(var_history, []) if instance_variable_defined?(var_name)
          instance_variable_set(var_name, value)
          instance_variable_get(var_history) << instance_variable_get(var_name)
        end
        define_method("@#{name}_history".to_sym) { instance_variable_get(var_history) }
      end
    end

    def strong_attr_acessor(name, claass)
      attr_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(attr_name) }
      define_method("@#{name}=".to_sym) do |value|
        if value.is_a?(claass)
          instance_variable_set(attr_name)
        else
          raise 'Wrong attribute class'
        end
      end
    end
  end

  module InstanceMethods
    # Empty Instance Methods
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
