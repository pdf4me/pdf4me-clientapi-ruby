module Pdf4me
  class MergeTwoPdfs < WrapperAction
    attr_accessor(
      :file1,
      :file2,
      :save_path
    )
    validates_presence_of(
      :file1,
      :file2
    )

    def path
      '/Merge/Merge2Pdfs'
    end

    def save_path
      @save_path ||= unless file1.nil? && file2.nil?
                       File.join(File.dirname(file1),
                         "Merged-#{File.basename(file1, ".*")}-#{File.basename(file2, ".*")}.pdf"
                       )
                     end
    end

    def call_api
      client.multipart_post(
        path,
        file1: File.open(file1, 'rb'),
        file2: File.open(file2, 'rb'),
      ) do |request|
        download(request, save_path)
      end
    end
  end
end
