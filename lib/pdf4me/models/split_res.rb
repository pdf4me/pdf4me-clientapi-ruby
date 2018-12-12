module Pdf4me
  class SplitRes < Base
    ATTRIBUTES = {
      documents: 'Array<Document>'
    }
    attr_accessor *ATTRIBUTES.keys
  end
end
