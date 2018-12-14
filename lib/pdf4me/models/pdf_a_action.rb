module Pdf4me
  class PdfAAction < Base
    ATTRIBUTES = {
      fonts_to_subset: 'Array<PdfFont>',
      compliance: 'String',
      allow_downgrade: 'BOOLEAN',
      allow_upgrade: 'BOOLEAN',
      out_put_intent_profile: 'String',
      linearize: 'BOOLEAN',
      custom_properties: 'Array<KeyValuePairStringString>'
    }
    attr_accessor *ATTRIBUTES.keys

    validates_inclusion_of(
      :compliance,
      in: %w|pdfA1b pdfA2B pdfA3b pdfA1a pdfA2a pdfA3a pdfA2u pdfA3u|
    )
    validates_inclusion_of(
      :out_put_intent_profile,
      in: %w|notSet sRGBColorSpace|
    )

    def defaults
      {
        compliance: 'pdf2Ab',
        allow_downgrade: false,
        allow_upgrade: false,
        out_put_intent_profile: 'notSet',
        linearize: false
      }
    end
  end
end
