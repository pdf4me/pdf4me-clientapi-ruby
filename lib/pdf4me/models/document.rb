module Pdf4me
  class Document < Base
    ATTRIBUTES = {
      job_id: 'String',
      document_id: 'String',
      name: 'String',
      doc_status: 'String',
      pages: 'Array<Page>',
      doc_data: 'String',
      doc_metadata: 'DocMetadata',
      doc_logs: 'Array<DocLog>',
      notification: 'Notification'
    }
    attr_accessor *ATTRIBUTES.keys
    validates_presence_of :doc_data
  end
end
