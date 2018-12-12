module Pdf4me
  module Assigner
    def assign_attributes(attributes = {})
      attributes.to_h.each do |key, value|
        writer_method = "#{key}="
        send(writer_method, value) if respond_to?(writer_method)
      end
    end
  end
end
