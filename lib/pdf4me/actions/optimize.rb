module Pdf4me
  class Optimize < ComplexAction
    ATTRIBUTES = %w|document optimize_action|
    attr_accessor *ATTRIBUTES

    def path
      '/Optimize/Optimize'
    end
  end
end
