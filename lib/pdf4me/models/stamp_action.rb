module Pdf4me
  class StampAction < Base
    ATTRIBUTES = {
      page_sequence: 'String',
      relative_pos_x: 'Integer',
      relative_pos_y: 'Integer',
      size_x: 'Integer',
      size_y: 'Integer',
      rotate: 'Float',
      autoorientation: 'BOOLEAN',
      alpha: 'Double',
      scale: 'String',
      align_x: 'String',
      align_y: 'String',
      stamp_type: 'String',
      text: 'Text',
      image: 'Image',
      custom_properties: 'Array<KeyValuePairStringString>'
    }
    attr_accessor *ATTRIBUTES.keys

    validates_inclusion_of(
      :page_sequence,
      in: %w|all first last odd even notFirst notLast|,
      if: ->(model){  /[a-z]+/i.match?(model.page_sequence) }
    )

    validates_inclusion_of(
      :scale,
      in: ['relToA4']
    )

    validates_inclusion_of(
      :align_x,
      in: %w|left center right|
    )

    validates_inclusion_of(
      :align_y,
      in: %w|top middle bottom|
    )

    validates_inclusion_of(
      :stamp_type,
      in: %w|annotation foreground background|
    )

    def defaults
      {
        page_sequence: '1',
        autoorientation: false,
        alpha: 1.0,
        scale: 'relToA4',
        align_x: 'left',
        align_y: 'bottom',
        stamp_type: 'annotation',
      }
    end
  end
end
