# Pdf4me::ImageApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_images**](ImageApi.md#create_images) | **POST** /Image/CreateImages | 
[**create_thumbnail**](ImageApi.md#create_thumbnail) | **POST** /Image/CreateThumbnail | 


# **create_images**
> CreateImagesRes create_images(opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::ImageApi.new

opts = { 
  req: Pdf4me::CreateImages.new # CreateImages | 
}

begin
  result = api_instance.create_images(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling ImageApi->create_images: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | [**CreateImages**](CreateImages.md)|  | [optional] 

### Return type

[**CreateImagesRes**](CreateImagesRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json, application/bson
 - **Accept**: text/plain, application/json, text/json, application/bson



# **create_thumbnail**
> File create_thumbnail(width, opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::ImageApi.new

width = 56 # Integer | 

opts = { 
  page_nr: "page_nr_example", # String | 
  image_format: "image_format_example", # String | 
  file: "file_example" # String | 
}

begin
  result = api_instance.create_thumbnail(width, opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling ImageApi->create_thumbnail: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **width** | **Integer**|  | 
 **page_nr** | **String**|  | [optional] 
 **image_format** | **String**|  | [optional] 
 **file** | **String**|  | [optional] 

### Return type

**File**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream



