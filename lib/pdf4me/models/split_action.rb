module Pdf4me
  class SplitAction < Base
    ATTRIBUTES = {
      split_after_page: 'Integer',
      split_sequence: 'Array<Integer>',
      recurring_split_after_page: 'Integer',
      custom_properties: 'Array<KeyValuePairStringString>'
    }
    attr_accessor *ATTRIBUTES.keys
  end
end