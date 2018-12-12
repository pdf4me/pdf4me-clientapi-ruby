module Pdf4me
  class Extract < ComplexAction
    ATTRIBUTES = %w|document extract_action|
    attr_accessor *ATTRIBUTES

    def path
      '/Extract/Extract'
    end
  end
end
