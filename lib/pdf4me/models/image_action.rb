module Pdf4me
  class ImageAction < Base
    ATTRIBUTES = {
      page_selection: 'PageSelection',
      center: 'BOOLEAN',
      fit_page: 'BOOLEAN',
      bits_per_pixel: 'Integer',
      bilevel_threshold: 'Integer',
      width_pixel: 'Integer',
      height_pixel: 'Integer',
      width_point: 'Integer',
      height_point: 'Integer',
      render_options: 'Array<String>',
      rotate_mode: 'String',
      preserve_active_ratio: 'BOOLEAN',
      image_quality: 'Integer',
      cms_engine: 'String',
      custom_cMS_config: 'CustomCmsConfig',
      dithering: 'String',
      dpi: 'Integer',
      fill_order: 'String',
      filter_ratio: 'Integer',
      image_extension: 'String',
      color_space: 'String',
      compression: 'String',
      custom_properties: 'Array<KeyValuePairStringString>'
    }
    attr_accessor *ATTRIBUTES.keys

    validates_presence_of :image_extension

    validates_inclusion_of(
      :bits_per_pixel,
      in: [1, 8, 24, 32]
    )

    validates_inclusion_of(
      :rotate_mode,
      in: %w|none attribute potrait landscape|
    )

    validates_inclusion_of(
      :cms_engine,
      in: %w|none neugebauer lcms customCMS|
    )

    validates_inclusion_of(
      :dithering,
      in: %w|none floydSteinberg halftone pattern g3Optimized g4Optimized atkinson|
    )

    validates_inclusion_of(
      :fill_order,
      in: %w|mSB ISB|
    )

    validates_inclusion_of(
      :image_extension,
      in: %w|jpg jpeg bmp gif jb2 jp2 jpf jpx png tif tiff|
    )

    validates_inclusion_of(
      :color_space,
      in: %w|RGB RGBA Gray GrayA CMYK YCbCR YCbCrK Palette LAB CMYK_Konly CMYKA|
    )

    validates_inclusion_of(
      :compression,
      in: %w|raw jPEG flate LZW group3 group3_2D group4 jBIG2 jPEG2000 tlFFJPEG|
    )

    validates_numericality_of(
      :bilevel_threshold,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 255
    )

    validates_numericality_of(
      :image_quality,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 100
    )

    validates_numericality_of(
      :filter_ratio,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 3
    )

    def defaults
      {
        center: false,
        fit_page: true,
        bits_per_pixel: 24,
        bilevel_threshold: 181,
        rotate_mode: 'attribute',
        preserve_aspect_ratio: true,
        image_quality: 80,
        cms_engine: 'lcms',
        dithering: 'floydSteinberg',
        dpi: 150,
        fill_order: 'mSB',
        filter_ratio: 1,
        color_space: 'RGB',
        compression: 'LZW',
      }
    end

  end
end
