# Pdf4me::OptimizeApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**optimize**](OptimizeApi.md#optimize) | **POST** /Optimize/Optimize | 
[**optimize_by_profile**](OptimizeApi.md#optimize_by_profile) | **POST** /Optimize/OptimizeByProfile | 


# **optimize**
> OptimizeRes optimize(opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::OptimizeApi.new

opts = { 
  req: Pdf4me::Optimize.new # Optimize | 
}

begin
  result = api_instance.optimize(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling OptimizeApi->optimize: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | [**Optimize**](Optimize.md)|  | [optional] 

### Return type

[**OptimizeRes**](OptimizeRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json, application/bson
 - **Accept**: text/plain, application/json, text/json, application/bson



# **optimize_by_profile**
> File optimize_by_profile(profile, opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::OptimizeApi.new

profile = "profile_example" # String | 

opts = { 
  file: "file_example" # String | 
}

begin
  result = api_instance.optimize_by_profile(profile, opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling OptimizeApi->optimize_by_profile: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile** | **String**|  | 
 **file** | **String**|  | [optional] 

### Return type

**File**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream



