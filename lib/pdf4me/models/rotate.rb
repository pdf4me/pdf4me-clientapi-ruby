module Pdf4me
  class Rotate < Base
    ATTRIBUTES = {
      angle: 'Double',
      origin_x: 'Integer',
      origin_y: 'Integer'
    }
    attr_accessor *ATTRIBUTES.keys

    validates_presence_of :angle, :origin_x, :origin_y
  end
end