module Pdf4me
  class Error < StandardError
    attr_reader :code, :error

    def initialize(arg = nil)
      if arg.is_a? Hash
        if arg.key?(:message) || arg.key?('message')
          super(arg[:message] || arg['message'])
        else
          super arg
        end

        arg.each do |k, v|
          instance_variable_set "@#{k}", v
        end
      else
        super arg
      end
    end
  end

  class InvalidStatusCode < Error; end
  class ServerTimedOut < Error; end
  class ServerError < Error; end
  class InvalidAttributes < Error; end
end
