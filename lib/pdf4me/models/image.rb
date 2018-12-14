module Pdf4me
  class Image < Base
    ATTRIBUTES = {
      image_data: 'String',
      image_type: 'String'
    }
    attr_accessor *ATTRIBUTES.keys

    validates_presence_of :image_data
  end
end
