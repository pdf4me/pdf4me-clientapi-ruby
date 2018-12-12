module Pdf4me
  class DocLog < Base
    ATTRIBUTES = {
      message_type: 'String',
      message: 'String',
      timestamp: 'DateTime',
      doc_log_level: 'String',
      duration_milliseconds: 'Integer'
    }
    LOG_LEVELS = %w|verbose info warning error timing|.freeze

    attr_accessor *ATTRIBUTES.keys

    def doc_log_level=(level)
      @doc_log_level = LOG_LEVELS[level.to_i]
    end
  end
end
