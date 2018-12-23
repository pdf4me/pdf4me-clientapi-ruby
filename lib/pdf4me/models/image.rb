module Pdf4me
  class Image < Base
    ATTRIBUTES = {
      image_data: 'String',
      image_type: 'String',
      rectangle: 'Rectangle',
      file_name: 'String',
      compression: 'String',
      rotate: 'Rotate',
      translate: 'Translate',
      transform: 'Transform'
    }
    attr_accessor *ATTRIBUTES.keys

    validates_presence_of :image_data
    validates_inclusion_of :compression, in: %w|cCITTFax flate dCT|

    def inspect
      "#<#{self.class}:0x#{object_id.to_s(16)}>"
    end

    def defaults
      {
        compression: 'flate'
      }
    end
  end
end
