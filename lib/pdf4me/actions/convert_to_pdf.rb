module Pdf4me
  class ConvertToPdf < ComplexAction
    ATTRIBUTES = %w|document convert_to_pdf_action|
    attr_accessor *ATTRIBUTES

    def path
      '/Convert/ConvertToPdf'
    end
  end
end
