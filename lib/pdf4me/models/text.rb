module Pdf4me
  class Text < Base
    ATTRIBUTES = {
      format: 'BOOLEAN',
      size: 'Integer',
      font: 'String',
      color: 'Color',
      font_encoding: 'String',
      value: 'String',
      mode: 'String',
      rotate: 'Rotate',
      translate: 'Translate',
      transform: 'Transform'
    }
    attr_accessor *ATTRIBUTES.keys

    validates_presence_of :value

    validates_inclusion_of(
      :font_encoding,
      in: %w|unicode winAnsi|
    )

    validates_inclusion_of(
      :mode,
      in: %w|fill stroke|
    )

    def defaults
      {
        format: false,
        font_encoding: 'unicode',
        mode: 'fill'
      }
    end
  end
end