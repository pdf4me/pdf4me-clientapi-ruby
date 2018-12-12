module Pdf4me
  class OptimizeAction < Base
    ATTRIBUTES = {
      profile: 'String',
      use_profile: 'BOOLEAN',
      remove_redundant_objects: 'BOOLEAN',
      subset_fonts: 'BOOLEAN',
      optimize_resources: 'BOOLEAN',
      force_compression_types: 'BOOLEAN',
      force_recompression: 'BOOLEAN',
      reduce_color_complexity: 'BOOLEAN',
      merge_embedded_fonts: 'BOOLEAN',
      bitonal_compressions: 'Array<String>',
      bitonal_resolution_dpi: 'Float',
      bitonal_threshold_dpi: 'Float',
      clip_images: 'BOOLEAN',
      continuous_compressions: 'Array<String>',
      linearize: 'BOOLEAN',
      image_quality: 'Integer',
      indexed_compressions: 'Array<String>',
      dithering_mode: 'String',
      color_resolution_dpi: 'Float',
      color_threshold_dpi: 'Float',
      monochrome_resolution_dpi: 'Float',
      monochrome_threshold_dpi: 'Float',
      resolution_dpi: 'Integer',
      threshold_dpi: 'Integer',
      strip: 'Array<String>',
      info_entries: 'Array<KeyValuePairStringString>',
      flatten_signature_fields: 'BOOLEAN',
      custom_properties: 'Array<KeyValuePairStringString>'
    }
    attr_accessor *ATTRIBUTES.keys

    validates_inclusion_of(
      :profile,
      in: %w|default web print max|
    )
    validates_numericality_of(
      :image_quality,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 100
    )
    validates_inclusion_of(
      :dithering_mode,
      in: %w|none floydSteinberg halftone pattern g3Optimized g4Optimized atkinson|
    )

    def defaults
      {
        profile: 'default',
        use_profile: false,
        remove_redundant_objects: false,
        subset_fonts: false,
        optimize_resources: false,
        force_compression_types: false,
        force_recompression: false,
        reduce_color_complexity: false,
        merge_embedded_fonts: false,
        bitonal_compressions: %w|none|,
        bitonal_resolution_dpi: 200,
        bitonal_threshold_dpi: -1,
        clip_images: false,
        continuous_compressions: %w|none|,
        linearize: false,
        image_quality: 75,
        dithering_mode: 'none',
        color_resolution_dpi: 150,
        color_threshold_dpi: -1,
        monochrome_resolution_dpi: 150,
        monochrome_threshold_dpi: -1,
        threshold_dpi: -1,
        strip: %w|threads|,
        flatten_signature_fields: false
      }
    end
  end
end
