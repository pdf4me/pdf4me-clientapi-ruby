module Pdf4me
  class CreateImages < ComplexAction
    ATTRIBUTES = %w|document image_action|
    attr_accessor *ATTRIBUTES

    def path
      '/Image/CreateImages'
    end
  end
end
