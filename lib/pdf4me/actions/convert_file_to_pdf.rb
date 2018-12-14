module Pdf4me
  class ConvertFileToPdf < WrapperAction
    attr_accessor(
      :file,
      :save_path
    )
    validates_presence_of(
      :file,
      :save_path
    )

    def path
      '/Convert/ConvertFileToPdf'
    end

    def save_path
      @save_path ||= unless file.nil?
                       File.join(File.dirname(file), "#{File.basename(file, ".*")}.pdf")
                     end
    end

    def call_api
      client.multipart_post(
        path,
        file_name: File.basename(file),
        file: File.open(file, 'rb'),
      ) do |request|
        download(request, save_path)
      end
    end
  end
end
