module Pdf4me
  class PdfARes < Base
    ATTRIBUTES = {
      document: 'Document'
    }
    attr_accessor *ATTRIBUTES.keys
  end
end