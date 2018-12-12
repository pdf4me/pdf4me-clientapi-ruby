module Pdf4me
  class CreateThumbnail < WrapperAction
    attr_accessor(
      :file,
      :width,
      :page_number,
      :image_format,
      :save_path
    )

    validates_presence_of(
      :file,
      :page_number,
      :width,
      :image_format,
      :save_path
    )

    validates_inclusion_of(
      :image_format,
      in: %w|jpg jpeg bmp gif jb2 jp2 jpf jpx png tif tiff"|,
      message: 'is invalid - should be one of jpg, jpeg, bmp, gif, jb2, jp2, jpf, jpx, png, tif, tiff'
    )
    validates_numericality_of :page_number, :width

    def path
      '/Image/CreateThumbnail'
    end

    def defaults
      {
        width: 100,
        image_format: 'png',
        page_number: 1
      }
    end

    def save_path
      @save_path ||= unless file.nil?
                       File.join(File.dirname(file), "#{File.basename(file, ".*")}-thumbnail.#{image_format}")
                     end
    end

    def call_api
      client.multipart_post(
        path,
        file: File.open(file, 'rb'),
        pageNr: page_number,
        width: width,
        imageFormat: image_format
      ) do |request|
        download(request, save_path)
      end
    end

  end
end
