module Pdf4me
  class TextStamp < WrapperAction
    attr_accessor(
      :position_x,
      :position_y,
      :text,
      :pages,
      :file,
      :save_path
    )
    validates_presence_of(
      :text,
      :pages
    )
    validates_inclusion_of(
      :position_x,
      in: %w|left center right|,
      message: 'is invalid, valid values are left, center, right.'
    )

    validates_inclusion_of(
      :position_y,
      in: %w|top middle bottom|,
      message: 'is invalid, valid values are top, middle, bottom.'
    )

    validate :page_attributes

    def pages=(value)
      @pages = Array(value)
    end


    def save_path
      @save_path ||= unless file.nil?
                       File.join(File.dirname(file), "#{File.basename(file, ".*")}-stamped.pdf")
                     end
    end

    def path
      '/Stamp/TextStamp'
    end

    def call_api
      client.multipart_post(
        path,
        file: File.open(file, 'rb'),
        alignX: position_x,
        alignY: position_y,
        text: text,
        pages: pages.join(',')
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
