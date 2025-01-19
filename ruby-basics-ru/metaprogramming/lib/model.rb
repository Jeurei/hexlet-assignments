# frozen_string_literal: true

# BEGIN
module Model
  def initialize(attributes = {})
    @attributes = {}

    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def attributes
    self.class.attribute_names.each_with_object({}) do |name, result|
      result[name] = send(name)
    end
  end

  private

  def convert_to_type(value, type)
    case type
    when :integer then value.to_i
    when :string then value.to_s
    when :datetime then begin
      DateTime.parse(value.to_s)
    rescue StandardError
      nil
    end
    when :boolean then [true, 'true', 1, '1'].include?(value)
    else value
    end
  end

  def self.included(base)
    base.extend(Methods)
  end

  module Methods
    def attribute(name, options = {})
      @attribute_names ||= []
      @attribute_names << name

      define_method(name) do
        if instance_variable_defined?("@#{name}")
          instance_variable_get("@#{name}")
        else
          options[:default].nil? ? nil : options[:default]
        end
      end

      define_method("#{name}=") do |value|
        type = options[:type]
        attributes = instance_variable_get('@attributes')

        new_value = if value.nil?
                      nil
                    elsif type.nil?
                      value
                    else
                      convert_to_type(value, type)
                    end

        instance_variable_set("@#{name}", new_value)
        instance_variable_set('@attributes', attributes.merge(name => new_value))
      end
    end

    def attribute_names
      @attribute_names || []
    end
  end
end
# END
