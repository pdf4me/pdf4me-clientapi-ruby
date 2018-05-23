# Pdf4me::StampAction

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**page_sequence** | **String** |  | [optional] 
**relative_pos_x** | **Integer** |  | [optional] 
**relative_pos_y** | **Integer** |  | [optional] 
**size_x** | **Integer** |  | [optional] 
**size_y** | **Integer** |  | [optional] 
**rotate** | **Float** |  | [optional] 
**autoorientation** | **BOOLEAN** |  | [optional] 
**alpha** | **Float** | The opacity of the stamp as a whole. 1.0 for fully opaque, 0.0 for fully transparent.  Default: 1.0  The PDF/A-1 standard does not allow transparency.Therefore, for PDF/A-1 conforming input files you must  not set alpha to a value other than 1.0 | [optional] 
**scale** | **String** | Modify scale of stamp. Allowed values for ‹scale_set› are:   - relToA4: Scale the stamp relative to the page size. For example, make stamp half as large on a A5 and  twice as large on a A3 page as specified. | [optional] 
**align_x** | **String** |  | [optional] 
**align_y** | **String** |  | [optional] 
**stamp_type** | **String** |  | [optional] 
**text** | [**Text**](Text.md) |  | [optional] 
**image** | [**Image**](Image.md) |  | [optional] 
**custom_properties** | [**Array&lt;KeyValuePairStringString&gt;**](KeyValuePairStringString.md) |  | [optional] 


