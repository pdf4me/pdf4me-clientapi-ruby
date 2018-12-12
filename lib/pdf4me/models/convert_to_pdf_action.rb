module Pdf4me
  class ConvertToPdfAction < Base
    ATTRIBUTES = {
      pdf_conformance: 'String',
      conversion_mode: 'String',
      custom_properties: 'Hash'
    }
    attr_accessor *ATTRIBUTES.keys

    validates_presence_of(
      :pdf_conformance,
      :conversion_mode
    )

    validates_inclusion_of(
      :pdf_conformance,
      in: %w|pdf17 pdfA1 pdfA2 pdfA3|
    )

    validates_inclusion_of(
      :conversion_mode,
      in: %w|fast detailed|
    )

    def defaults
      {
        pdf_conformance: 'pdf17',
        conversion_mode: 'fast'
      }
    end

  end
end
