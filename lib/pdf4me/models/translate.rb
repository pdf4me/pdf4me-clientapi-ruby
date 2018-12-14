module Pdf4me
  class Translate < Base
    ATTRIBUTES = {
      offset_x: 'Integer',
      offset_y: 'Integer'
    }
    attr_accessor *ATTRIBUTES.keys

    validates_presence_of :offset_x, :offset_y

  end
end