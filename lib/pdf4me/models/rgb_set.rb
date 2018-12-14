module Pdf4me
  class RGBSet < Base
    ATTRIBUTES = {
      red: 'Integer',
      green: 'Integer',
      blue: 'Integer'
    }
    attr_accessor *ATTRIBUTES.keys
  end
end