module Pdf4me
  class Page < Base
    ATTRIBUTES =
      {
        document_id: 'String',
        page_id: 'String',
        page_number: 'Integer',
        rotate: 'Float',
        thumbnail: 'String',
        source_document_id: 'String',
        source_page_number: 'Integer'
    }

    attr_accessor *ATTRIBUTES.keys
  end
end
