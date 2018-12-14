module Pdf4me
  class OptimizeByProfile < WrapperAction
    attr_accessor(
      :file,
      :profile,
      :save_path
    )
    validates_presence_of(
      :file,
      :profile,
      :save_path
    )
    validates_inclusion_of(
      :profile, in: %w|default web print max|,
      message: 'is invalid, valid values are default, web, print, max.'
    )

    def defaults
      {
        profile: 'default'
      }
    end

    def path
      '/Optimize/OptimizeByProfile'
    end

    def save_path
      @save_path ||= unless file.nil?
                       File.join(File.dirname(file), "#{File.basename(file, ".*")}-optimized.pdf")
                     end
    end

    def call_api
      client.multipart_post(
        path,
        file: File.open(file, 'rb'),
        profile: profile
      ) do |request|
        download(request, save_path)
      end
    end
  end
end
