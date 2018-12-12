module Pdf4me
  class DocMetadata < Base
    ATTRIBUTES = {
      title: 'String',
      subject: 'String',
      page_count: 'Integer',
      size: 'Integer',
      is_encrypted: 'BOOLEAN',
      pdf_compliance: 'String',
      is_signed: 'BOOLEAN',
      uploaded_mime_type: 'String',
      uploaded_file_size: 'Integer'
    }
    attr_accessor *ATTRIBUTES.keys
  end
end
