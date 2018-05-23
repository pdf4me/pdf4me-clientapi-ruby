# Pdf4me::SplitApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**split**](SplitApi.md#split) | **POST** /Split/Split | 
[**split_by_page_nr**](SplitApi.md#split_by_page_nr) | **POST** /Split/SplitByPageNr | 


# **split**
> SplitRes split(opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::SplitApi.new

opts = { 
  req: Pdf4me::Split.new # Split | 
}

begin
  result = api_instance.split(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling SplitApi->split: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | [**Split**](Split.md)|  | [optional] 

### Return type

[**SplitRes**](SplitRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json, application/bson
 - **Accept**: text/plain, application/json, text/json, application/bson



# **split_by_page_nr**
> SplitRes split_by_page_nr(page_nr, opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::SplitApi.new

page_nr = 56 # Integer | 

opts = { 
  file: "file_example" # String | 
}

begin
  result = api_instance.split_by_page_nr(page_nr, opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling SplitApi->split_by_page_nr: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page_nr** | **Integer**|  | 
 **file** | **String**|  | [optional] 

### Return type

[**SplitRes**](SplitRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json, application/bson



