module Pdf4me
  class Base
    extend Pdf4me::Serializer
    include ActiveModel::Validations
    include Pdf4me::Assigner

    def initialize(attrs = {})
      merged_attrs = defaults.merge(attrs)
      assign_attributes(merged_attrs)
    end

    def defaults
      {}
    end

    def attributes
      attrs = self.class::ATTRIBUTES.stringify_keys.keys
      attrs.each_with_object({}) do |attribute, memo|
        value = send(attribute)
        if value.kind_of?(Pdf4me::Base)
          value = value.attributes
        end

        if value.present?
          memo[attribute.camelize(:lower)] = value
        end
      end
    end
  end
end
