module Pdf4me
  class CreatePdfA < WrapperAction
    attr_accessor(
      :file,
      :compliance
    )
    validates_presence_of(
      :compliance,
      :file
    )
    validates_inclusion_of(
      :compliance,
      in: %w|pdfA1b pdfA1a pdfA2b pdfA2u pdfA2a pdfA3b pdfA3u pdfA3a|,
      message: 'is invalid. It should be any of pdfA1b, pdfA1a, pdfA2b, pdfA2u, pdfA2a, pdfA3b, pdfA3u, pdfA3a'
    )

    def path
      '/PdfA/CreatePdfA'
    end
    
    def call_api
      client.multipart_post(
        path,
        file: File.open(file, 'rb'),
        pdfCompliance: compliance
      )
    end
  end
end
