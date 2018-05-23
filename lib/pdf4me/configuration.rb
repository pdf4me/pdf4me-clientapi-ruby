require 'uri'
require 'adal'

module Pdf4me
  class Configuration

    # Defines url host
    attr_accessor :host

    attr_accessor :app_id

    attr_accessor :app_secret

    # Defines the access token (Bearer) used with OAuth2.
    attr_accessor :access_token

    # Set this to enable/disable debugging. When enabled (set to true), HTTP request/response
    # details will be logged with `logger.debug` (see the `logger` attribute).
    # Default to false.
    #
    # @return [true, false]
    attr_accessor :debugging

    # Defines the logger used for debugging.
    # Default to `Rails.logger` (when in Rails) or logging to STDOUT.
    #
    # @return [#debug]
    attr_accessor :logger

    # Defines the temporary folder to store downloaded files
    # (for API endpoints that have file response).
    # Default to use `Tempfile`.
    #
    # @return [String]
    attr_accessor :temp_folder_path

    # The time limit for HTTP request in seconds.
    # Default to 0 (never times out).
    attr_accessor :timeout

    # Set this to false to skip client side validation in the operation.
    # Default to true.
    # @return [true, false]
    attr_accessor :client_side_validation

    # Set this to customize parameters encoding of array parameter with multi collectionFormat.
    # Default to nil.
    #
    # @see The params_encoding option of Ethon. Related source code:
    # https://github.com/typhoeus/ethon/blob/master/lib/ethon/easy/queryable.rb#L96
    attr_accessor :params_encoding

    attr_accessor :inject_format

    attr_accessor :force_ending_format

    AZURE_TENANT = 'devynooxlive.onmicrosoft.com'.freeze

    def initialize
      @host = ''
      @timeout = 0
      @client_side_validation = true
      @params_encoding = nil
      @debugging = false
      @inject_format = false
      @force_ending_format = false
      @logger = defined?(Rails) ? Rails.logger : Logger.new(STDOUT)

      yield(self) if block_given?
    end

    # The default Configuration object.
    def self.default
      @@default ||= Configuration.new
    end

    def configure
      yield(self) if block_given?
    end

    def host=(host)
      # remove http(s):// and anything after a slash
      @host = host.sub(/https?:\/\//, '').split('/').first
    end

    def base_url
      url = "https://#{host}"
      URI.encode(url)
    end

    def access_token
      @access_token ||= generate_access_token
    end

    private

    def generate_access_token
      client_credentials = ADAL::ClientCredential.new(app_id, app_secret)
      auth_context = ADAL::AuthenticationContext.new(
        ADAL::Authority::WORLD_WIDE_AUTHORITY,
        AZURE_TENANT
      )
      auth_context.acquire_token_for_client(
        app_id,
        client_credentials
      ).fields['access_token']
    end
  end
end
