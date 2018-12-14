module Pdf4me
  class Configuration
    attr_accessor(
      :host,
      :token,
      :debugging,
      :logger
    )

    def initialize
      @host = 'api.pdf4me.com'
      @token = ENV['PDF4ME_TOKEN']
      @debugging = false
      @logger = defined?(Rails) ? Rails.logger : Logger.new(STDOUT)
    end

    def self.default
      @@default ||= Configuration.new
    end

    def host=(host)
      @host = host.sub(/https?:\/\//, '').split('/').first.freeze
    end

    def base_url
      url = "https://#{host}"
      URI.encode(url).freeze
    end
  end
end
