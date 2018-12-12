module Pdf4me
  class PageSelection < Base
    ATTRIBUTES = {
      page_nrs: 'Array<Integer>',
      page_ids: 'Array<String>',
      page_sequence: 'String'
    }
    attr_accessor *ATTRIBUTES.keys

    validates_inclusion_of(
      :page_sequence,
      in: %w|all first last odd even notFirst notLast|
    )

    def defaults
      {
        page_sequence: 'all'
      }
    end
  end
end
