require 'json'
require 'logger'
require 'uri'
require 'typhoeus'
require 'date'
require 'active_model'

require 'pdf4me/version'
require 'pdf4me/configuration'
require 'pdf4me/client'
require 'pdf4me/exceptions'

#utils
require 'pdf4me/utils/assigner'
require 'pdf4me/utils/serializer'

require 'pdf4me/actions/wrapper_action'
require 'pdf4me/actions/optimize_by_profile'
require 'pdf4me/actions/convert_file_to_pdf'
require 'pdf4me/actions/extract_pages'
require 'pdf4me/actions/create_thumbnail'
require 'pdf4me/actions/merge_two_pdfs'
require 'pdf4me/actions/create_pdf_a'
require 'pdf4me/actions/split_by_page_nr'
require 'pdf4me/actions/text_stamp'

# complex operations
require 'pdf4me/actions/complex_action'
require 'pdf4me/actions/convert_to_pdf'
require 'pdf4me/actions/optimize'
require 'pdf4me/actions/create_images'
require 'pdf4me/actions/extract'
require 'pdf4me/actions/merge'
require 'pdf4me/actions/pdf_a'
require 'pdf4me/actions/split'
require 'pdf4me/actions/stamp'

# models
require 'pdf4me/models/base'
require 'pdf4me/models/document'
require 'pdf4me/models/convert_to_pdf_action'
require 'pdf4me/models/notification'
require 'pdf4me/models/convert_to_pdf_res'
require 'pdf4me/models/doc_log'
require 'pdf4me/models/doc_metadata'
require 'pdf4me/models/page'
require 'pdf4me/models/optimize_action'
require 'pdf4me/models/optimize_res'
require 'pdf4me/models/color'
require 'pdf4me/models/custom_cms_config'
require 'pdf4me/models/extract_action'
require 'pdf4me/models/extract_res'
require 'pdf4me/models/image_action'
require 'pdf4me/models/create_images_res'
require 'pdf4me/models/merge_action'
require 'pdf4me/models/merge_res'
require 'pdf4me/models/page_selection'
require 'pdf4me/models/pdf_a_action'
require 'pdf4me/models/pdf_a_res'
require 'pdf4me/models/pdf_font'
require 'pdf4me/models/rgb_set'
require 'pdf4me/models/rotate'
require 'pdf4me/models/split_action'
require 'pdf4me/models/split_res'
require 'pdf4me/models/stamp_action'
require 'pdf4me/models/stamp_res'
require 'pdf4me/models/text'
require 'pdf4me/models/transform'
require 'pdf4me/models/translate'
require 'pdf4me/models/image'



module Pdf4me
  def self.configure
    if block_given?
      yield(Configuration.default)
    else
      Configuration.default
    end
  end
end
