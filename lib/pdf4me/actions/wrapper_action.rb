require 'active_model'

module Pdf4me
  class WrapperAction
    include ActiveModel::Validations

    attr_reader :client

    def client
      @client ||= Client.default
    end

    def assign_attributes(attributes = {})
      attributes.to_h.each do |key, value|
        writer_method = "#{key}="
        send(writer_method, value) if respond_to?(writer_method)
      end
    end

    def initialize(attrs = {})
      attributes = defaults.merge(attrs)
      assign_attributes(attributes)
    end

    def defaults
      {}
    end

    def run
      return false if invalid?
      call_api.success?
    end

    def run!
      validate!
      call_api.success?
    end

    protected

    def download(request, path)
      downloaded_file = File.open(path, 'wb')
      encoding = nil

      request.on_headers do |response|
        if response.code != 200
          fail InvalidStatusCode.new(code: response.code, error: response.body)
        end
        encoding = response.body.encoding
      end
      request.on_body do |chunk|
        chunk.force_encoding(encoding)
        downloaded_file.write(chunk)
      end

      request.on_complete do |response|
        downloaded_file.close
      end
    end

    def parsed_json_response(response)
      JSON.parse(response, symbolize_names: true)
    end
  end
end
