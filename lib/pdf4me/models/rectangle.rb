module Pdf4me
  class Rectangle < Base
    ATTRIBUTES = {
      x: 'Integer',
      y: 'Integer',
      width: 'Integer',
      height: 'Integer'
    }

    attr_accessor *ATTRIBUTES.keys
    validates_presence_of :width, :height
  end
end


