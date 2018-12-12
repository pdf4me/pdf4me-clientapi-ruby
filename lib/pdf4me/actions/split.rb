module Pdf4me
  class Split < ComplexAction
    ATTRIBUTES = %w|document split_action|
    attr_accessor *ATTRIBUTES

    def path
      '/Split/Split'
    end
  end
end