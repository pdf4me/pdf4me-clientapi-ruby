module Pdf4me
  class PdfA < ComplexAction
    ATTRIBUTES = %w|document pdf_a_action|
    attr_accessor *ATTRIBUTES

    def path
      'PdfA/PdfA'
    end
  end
end