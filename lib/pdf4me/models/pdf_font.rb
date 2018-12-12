module Pdf4me
  class PdfFont < Base
    ATTRIBUTES = {
      name: 'String',
      font_content: 'String'
    }
    attr_accessor *ATTRIBUTES.keys
  end
end
