module Pdf4me
  class MergeRes < Base
    ATTRIBUTES = {
      document: 'Document'
    }
    attr_accessor *ATTRIBUTES.keys
  end
end