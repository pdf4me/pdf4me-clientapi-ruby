# Pdf4me::ManagementApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**api_usage**](ManagementApi.md#api_usage) | **POST** /Management/ApiUsage | ApiUsage
[**version**](ManagementApi.md#version) | **POST** /Management/Version | Version


# **api_usage**
> ApiUsageRes api_usage

ApiUsage

Give an overview of current ApiUsage and if its payment.

### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::ManagementApi.new

begin
  #ApiUsage
  result = api_instance.api_usage
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling ManagementApi->api_usage: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ApiUsageRes**](ApiUsageRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json, application/bson



# **version**
> VersionRes version

Version

A simple method to get the current Version

### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::ManagementApi.new

begin
  #Version
  result = api_instance.version
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling ManagementApi->version: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**VersionRes**](VersionRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json, application/bson



