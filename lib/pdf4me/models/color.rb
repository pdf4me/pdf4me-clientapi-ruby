module Pdf4me
  class Color < Base
    ATTRIBUTES = {
      red: 'Integer',
      green: 'Integer',
      blue: 'Integer'
    }
    attr_accessor *ATTRIBUTES.keys
  end
end