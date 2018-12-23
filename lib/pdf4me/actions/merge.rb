module Pdf4me
  class Merge < ComplexAction
    ATTRIBUTES = %w|documents merge_action|
    attr_accessor *ATTRIBUTES

    def path
      '/Merge/Merge'
    end

    def merge_action
      @merge_action || Pdf4me::MergeAction.new
    end

    # this does not follow the convention at all.
    protected

    def valid_objects?
      documents.is_a?(Array) &&
        merge_action.is_a?(Pdf4me::MergeAction)
    end

    def valid_instances?
      merge_action.valid?
    end

    def serialize_attributes
      {
        documents: documents.map { |document| document.attributes },
        merge_action: merge_action.attributes
      }
    end
  end
end
