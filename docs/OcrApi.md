# Pdf4me::OcrApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**recognize_document**](OcrApi.md#recognize_document) | **POST** /Ocr/RecognizeDocument | RecognizeDocument


# **recognize_document**
> RecognizeDocumentRes recognize_document(opts)

RecognizeDocument

Recognize a Document with OCR and more advanced recognition possibilities like reading out structured business data in form of table.

### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::OcrApi.new

opts = { 
  req: Pdf4me::RecognizeDocument.new # RecognizeDocument | 
}

begin
  #RecognizeDocument
  result = api_instance.recognize_document(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling OcrApi->recognize_document: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | [**RecognizeDocument**](RecognizeDocument.md)|  | [optional] 

### Return type

[**RecognizeDocumentRes**](RecognizeDocumentRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json, application/bson
 - **Accept**: text/plain, application/json, text/json, application/bson



