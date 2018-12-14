module Pdf4me
  class ExtractAction < Base

    ATTRIBUTES = {
      extract_pages: 'Array<Integer>',
      custom_properties: 'Array<KeyValuePairStringString>'
    }
    attr_accessor *ATTRIBUTES.keys

    validate :page_attributes

    def extract_pages=(pages)
      @extract_pages = Array(pages)
    end

    private

    def page_attributes
      if extract_pages.empty?
        errors.add(:extract_pages, 'must be valid numeric value')
      end

      unless extract_pages.all? { |i| i.is_a?(Integer) }
        errors.add(:extract_pages, 'contains values that are not numbers')
      end
    end
  end
end
