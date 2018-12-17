module Pdf4me
  class Image < Base
    ATTRIBUTES = {
      image_data: 'String',
      image_type: 'String'
    }
    attr_accessor *ATTRIBUTES.keys

    validates_presence_of :image_data

    def inspect
      "#<#{self.class}:0x#{object_id.to_s(16)}>"
    end
  end
end
