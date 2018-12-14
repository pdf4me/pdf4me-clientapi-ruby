module Pdf4me
  module Serializer
    def from_response(response)
      attributes = JSON.parse(response.body)
      return nil unless attributes.is_a?(Hash)
      from_hash(attributes)
    end

    def from_hash(attributes)
      model_attributes = {}

      self::ATTRIBUTES.stringify_keys.each do |key, type|
        hash_key = key.camelize(:lower)
        hash_value =  attributes[hash_key]

        if type =~ /\AArray<(.*)>/i
          model_attributes[key] = Array(hash_value).map { |value| _deserialize($1, value) }
        elsif !hash_value.nil?
          model_attributes[key] = _deserialize(type, hash_value)
        end
      end

      new(model_attributes)
    end

    def _deserialize(type, value)
      case type
        when 'String'
          value.to_s
        when 'DateTime'
          DateTime.parse(value)
        when 'Date'
          Date.parse(value)
        when 'Integer'
          value.to_i
        when 'BOOLEAN'
          value == 'true'
        when 'Float'
          value.to_f
        else
          Pdf4me.const_get(type).from_hash(value)
      end
    end
  end
end
