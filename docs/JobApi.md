# Pdf4me::JobApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_archive_job_config**](JobApi.md#create_archive_job_config) | **POST** /Job/CreateArchiveJobConfig | CreateArchiveJobConfig
[**job_configs**](JobApi.md#job_configs) | **GET** /Job/JobConfigs | JobConfigs
[**run_job**](JobApi.md#run_job) | **POST** /Job/RunJob | RunJob
[**save_job_config**](JobApi.md#save_job_config) | **POST** /Job/SaveJobConfig | SaveJobConfig


# **create_archive_job_config**
> ArchiveJobReq create_archive_job_config(opts)

CreateArchiveJobConfig

Create Archive Job which continuesly converts your PDF to Pdf-A.

### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::JobApi.new

opts = { 
  req: Pdf4me::ArchiveJobReq.new # ArchiveJobReq | 
}

begin
  #CreateArchiveJobConfig
  result = api_instance.create_archive_job_config(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling JobApi->create_archive_job_config: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | [**ArchiveJobReq**](ArchiveJobReq.md)|  | [optional] 

### Return type

[**ArchiveJobReq**](ArchiveJobReq.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json, application/bson
 - **Accept**: text/plain, application/json, text/json, application/bson



# **job_configs**
> Array&lt;JobConfig&gt; job_configs

JobConfigs

Give a list of user defined Job Configurations.

### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::JobApi.new

begin
  #JobConfigs
  result = api_instance.job_configs
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling JobApi->job_configs: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Array&lt;JobConfig&gt;**](JobConfig.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json, application/bson



# **run_job**
> RunJobRes run_job(opts)

RunJob

Run a JobConfig with given Document Data. Documents can be given directly in the Job or as a Documen Reference.

### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::JobApi.new

opts = { 
  req: Pdf4me::Job.new # Job | 
}

begin
  #RunJob
  result = api_instance.run_job(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling JobApi->run_job: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | [**Job**](Job.md)|  | [optional] 

### Return type

[**RunJobRes**](RunJobRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json, application/bson
 - **Accept**: text/plain, application/json, text/json, application/bson



# **save_job_config**
> JobConfigRes save_job_config(opts)

SaveJobConfig

Create a Job Configuration for recurring executions or pipelining of pdf4me functionality.  With pipelining it is possible to run pdf4me base functionality in a specific order as a single execution.

### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::JobApi.new

opts = { 
  req: Pdf4me::JobConfig.new # JobConfig | 
}

begin
  #SaveJobConfig
  result = api_instance.save_job_config(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling JobApi->save_job_config: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | [**JobConfig**](JobConfig.md)|  | [optional] 

### Return type

[**JobConfigRes**](JobConfigRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json, application/bson
 - **Accept**: text/plain, application/json, text/json, application/bson



