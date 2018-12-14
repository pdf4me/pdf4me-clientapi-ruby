module Pdf4me
  class ExtractPages < WrapperAction
    attr_accessor(
      :file,
      :save_path,
      :pages
    )
    validates_presence_of(
      :file,
      :save_path
    )

    validate :page_attributes

    def pages=(value)
      @pages = Array(value)
    end

    def path
      '/Extract/ExtractPages'
    end

    def save_path
      @save_path ||= unless file.nil?
                       File.join(File.dirname(file), "extracted_pages.pdf")
                     end
    end

    def call_api
      client.multipart_post(
        path,
        file: File.open(file, 'rb'),
        pageNrs: pages.join(',')
      ) do |request|
        download(request, save_path)
      end
    end

    private

    def page_attributes
      if pages.empty?
        errors.add(:pages, 'must be valid numeric value')
      end

      unless pages.all? { |i| i.is_a?(Integer) }
        errors.add(:pages, 'contains values that are not numbers')
      end
    end
  end
end
