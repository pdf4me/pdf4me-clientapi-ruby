module Pdf4me
  class Notification < Base
    ATTRIBUTES = {
      get_notification: 'String',
      connection_id: 'String'
    }

    attr_accessor *ATTRIBUTES.keys

    def defaults
      {
        get_notification: false
      }
    end
  end
end
