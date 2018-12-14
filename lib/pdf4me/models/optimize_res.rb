module Pdf4me
  class OptimizeRes < Base
    ATTRIBUTES = {
      document: 'Document',
      trace_id: 'String'
    }

    attr_accessor *ATTRIBUTES.keys
  end
end
