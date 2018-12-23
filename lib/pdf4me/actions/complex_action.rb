module Pdf4me
  class ComplexAction
    attr_reader :client

    def client
      @client ||= Client.default
    end

    def assign_attributes(attributes = {})
      attributes.to_h.each do |key, value|
        writer_method = "#{key}="
        send(writer_method, value) if respond_to?(writer_method)
      end
    end

    def initialize(attributes = {})
      assign_attributes(attributes)
    end

    def run
      return unless valid?
      response = client.post(
        path,
        serialize_attributes.to_json
      )
      Pdf4me.const_get("#{self.class.name}Res").from_response(response)
    end

    def valid?
      valid_objects? && valid_instances?
    end

    def errors
      errors = attributes.map do |attribute|
        send(attribute).errors.full_messages
      end
      errors.flatten
    end

    protected

    def attributes
      self.class::ATTRIBUTES
    end

    def valid_objects?
      attributes.all? do |value|
        send(value).class.name == "pdf4me/#{value}".classify
      end
    end

    def valid_instances?
      attributes.all? do |attribute|
        send(attribute).valid?
      end
    end

    def serialize_attributes
      attributes.each_with_object({}) do |attribute, hash|
        hash[attribute.camelize(:lower)] = send(attribute).attributes
      end
    end
  end
end
