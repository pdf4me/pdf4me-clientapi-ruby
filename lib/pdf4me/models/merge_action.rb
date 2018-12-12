module Pdf4me
  class MergeAction < Base
    ATTRIBUTES = {
      custom_properties: 'Array<KeyValuePairStringString>'
    }
    attr_accessor *ATTRIBUTES.keys
  end
end