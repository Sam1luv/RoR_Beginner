module Acessors
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end

  module ClassMethods
    def attr_acessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        var_history = "@#{name}_history".to_sym
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}=") do |value|
          instance_variable_set(var_history, []) unless instance_variable_defined?(var_name)
          instance_variable_set(var_name, value)
          instance_variable_get(var_history) << instance_variable_get(var_name)
        end
        define_method("#{name}_history".to_sym) { instance_variable_get(var_history) }
      end
    end

    def strong_attr_acessor(name, claass)
      attr_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(attr_name) }
      define_method("#{name}=".to_sym) do |value|
        return instance_variable_set(attr_name, value) if value.is_a?(claass)
        raise 'Wrong attribute class'
      end
    end
  end

  module InstanceMethods
    # Empty Instance Methods
  end
end

#class Example
#  include Acessors

#  attr_acessor_with_history :example1
#  strong_attr_acessor :example2, String

#end

# ex = Example.new
# #<Example:0x00000001cfa0c0> 
# ex.example1 = 5
# => 5
# ex.example1 = 6
# => 5
# ex.example1 = 'str'
# => 'str'
# ex.example1_history => [5, 6, 'str']
# => [5, 6, 'str']
# ex.example2 = 5
# RuntimeError: Wrong attribute class
# ex.example2 = 'str'
# => 'str' 
