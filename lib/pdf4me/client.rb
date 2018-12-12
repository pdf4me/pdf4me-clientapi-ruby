module Pdf4me
  class Client
    attr_accessor :config
    attr_reader :logger

    def initialize(config = Configuration.default)
      @config = config
    end

    def self.default
      @@default ||= Client.new
    end

    def logger
      @logger ||= config.logger
    end

    def request_url(path)
      URI.join(config.base_url, path)
    end

    def multipart_post(path, params)
      request = multipart_request(path, params)

      if block_given?
       yield request
      end

      request.run.tap do |response|
        validate_response!(response)
      end
    end

    def post(path, params)
      logger.debug(params)
      request = Typhoeus::Request.new(
        request_url(path),
        method: :post,
        body: params,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': "Basic #{config.token}",
          'User-Agent': "Pdf4meClient/#{VERSION}/ruby"
        },
        timeout: 0,
        ssl_verifypeer: true,
        ssl_verifyhost: 2,
        verbose: config.debugging
      )

      request.run.tap do |response|
        validate_response!(response)
      end
    end

    private

    def multipart_request(path, params)
      Typhoeus::Request.new(
        request_url(path),
        method: :post,
        body: params,
        headers: {
          'Accept': 'application/octet-stream',
          'Content-Type': 'multipart/form-data',
          'Authorization': "Basic #{config.token}",
          'User-Agent': "Pdf4meClient/#{VERSION}/ruby"
        },
        timeout: 0,
        ssl_verifypeer: true,
        ssl_verifyhost: 2,
        verbose: config.debugging
      )
    end

    def validate_response!(response)
      unless response.success?
        if response.timed_out?
          fail ServerTimedOut.new('Server timed out')
        else
          fail ServerError.new(code: response.code, error: response.body)
        end
      end
    end
  end
end
