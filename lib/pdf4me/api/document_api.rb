require "uri"

module Pdf4me
  class DocumentApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # DropDocument
    # Drop a document from local FIlesystem or give a cloud storage from where the files will be downloaded.
    # @param [Hash] opts the optional parameters
    # @option opts [DropDocumentReq] :req 
    # @return [DropDocumentRes]
    def drop_document(opts = {})
      data, _status_code, _headers = drop_document_with_http_info(opts)
      return data
    end

    # DropDocument
    # Drop a document from local FIlesystem or give a cloud storage from where the files will be downloaded.
    # @param [Hash] opts the optional parameters
    # @option opts [DropDocumentReq] :req 
    # @return [Array<(DropDocumentRes, Fixnum, Hash)>] DropDocumentRes data, response status code and response headers
    def drop_document_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentApi.drop_document ..."
      end
      # resource path
      local_var_path = "/Document/DropDocument"

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/plain', 'application/json', 'text/json', 'application/bson'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json-patch+json', 'application/json', 'text/json', 'application/*+json', 'application/bson'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(opts[:'req'])
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'DropDocumentRes')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentApi#drop_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # ProduceDocuments
    # Produce the requested new Order Documents.
    # @param [Hash] opts the optional parameters
    # @option opts [ProduceDocuments] :req 
    # @return [ProduceDocumentsRes]
    def drop_document_0(opts = {})
      data, _status_code, _headers = drop_document_0_with_http_info(opts)
      return data
    end

    # ProduceDocuments
    # Produce the requested new Order Documents.
    # @param [Hash] opts the optional parameters
    # @option opts [ProduceDocuments] :req 
    # @return [Array<(ProduceDocumentsRes, Fixnum, Hash)>] ProduceDocumentsRes data, response status code and response headers
    def drop_document_0_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentApi.drop_document_0 ..."
      end
      # resource path
      local_var_path = "/Document/ProduceDocuments"

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/plain', 'application/json', 'text/json', 'application/bson'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json-patch+json', 'application/json', 'text/json', 'application/*+json', 'application/bson'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(opts[:'req'])
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ProduceDocumentsRes')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentApi#drop_document_0\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # GetDocument
    # Get the content of a document in its full datastructure and content.
    # @param [Hash] opts the optional parameters
    # @option opts [GetDocumentReq] :req 
    # @return [GetDocumentRes]
    def get_document(opts = {})
      data, _status_code, _headers = get_document_with_http_info(opts)
      return data
    end

    # GetDocument
    # Get the content of a document in its full datastructure and content.
    # @param [Hash] opts the optional parameters
    # @option opts [GetDocumentReq] :req 
    # @return [Array<(GetDocumentRes, Fixnum, Hash)>] GetDocumentRes data, response status code and response headers
    def get_document_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentApi.get_document ..."
      end
      # resource path
      local_var_path = "/Document/GetDocument"

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/plain', 'application/json', 'text/json', 'application/bson'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json-patch+json', 'application/json', 'text/json', 'application/*+json', 'application/bson'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(opts[:'req'])
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GetDocumentRes')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentApi#get_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # GetDocuments
    # Get the workingset of documents by the JobId.
    # @param job_id 
    # @param [Hash] opts the optional parameters
    # @return [GetDocumentRes]
    def get_documents(job_id, opts = {})
      data, _status_code, _headers = get_documents_with_http_info(job_id, opts)
      return data
    end

    # GetDocuments
    # Get the workingset of documents by the JobId.
    # @param job_id 
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetDocumentRes, Fixnum, Hash)>] GetDocumentRes data, response status code and response headers
    def get_documents_with_http_info(job_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DocumentApi.get_documents ..."
      end
      # verify the required parameter 'job_id' is set
      if @api_client.config.client_side_validation && job_id.nil?
        fail ArgumentError, "Missing the required parameter 'job_id' when calling DocumentApi.get_documents"
      end
      # resource path
      local_var_path = "/Document/GetDocuments"

      # query parameters
      query_params = {}
      query_params[:'jobId'] = job_id

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/plain', 'application/json', 'text/json', 'application/bson'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GetDocumentRes')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DocumentApi#get_documents\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
