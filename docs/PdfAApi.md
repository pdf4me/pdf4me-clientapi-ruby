# Pdf4me::PdfAApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_pdf_a**](PdfAApi.md#create_pdf_a) | **POST** /PdfA/CreatePdfA | 
[**pdf_a**](PdfAApi.md#pdf_a) | **POST** /PdfA/PdfA | 


# **create_pdf_a**
> File create_pdf_a(opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::PdfAApi.new

opts = { 
  pdf_compliance: "pdf_compliance_example", # String | 
  file: "file_example" # String | 
}

begin
  result = api_instance.create_pdf_a(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling PdfAApi->create_pdf_a: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pdf_compliance** | **String**|  | [optional] 
 **file** | **String**|  | [optional] 

### Return type

**File**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream



# **pdf_a**
> CreatePdfARes pdf_a(opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::PdfAApi.new

opts = { 
  req: Pdf4me::CreatePdfA.new # CreatePdfA | 
}

begin
  result = api_instance.pdf_a(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling PdfAApi->pdf_a: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | [**CreatePdfA**](CreatePdfA.md)|  | [optional] 

### Return type

[**CreatePdfARes**](CreatePdfARes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json, application/bson
 - **Accept**: text/plain, application/json, text/json, application/bson



