module Pdf4me
  class StampRes < Base
    ATTRIBUTES = {
      document: 'Document'
    }
    attr_accessor *ATTRIBUTES.keys
  end
end