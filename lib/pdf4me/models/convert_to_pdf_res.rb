module Pdf4me
  class ConvertToPdfRes < Base
    ATTRIBUTES = {
      document: 'Document',
      trace_id: 'String'
    }

    attr_accessor *ATTRIBUTES.keys
  end
end
