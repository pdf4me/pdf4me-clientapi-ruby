module Pdf4me
  class Stamp < ComplexAction
    ATTRIBUTES = %w|document stamp_action|
    attr_accessor *ATTRIBUTES

    def path
      '/Stamp/Stamp'
    end
  end
end