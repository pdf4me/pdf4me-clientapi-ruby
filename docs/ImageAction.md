# Pdf4me::ImageAction

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**page_selection** | [**PageSelection**](PageSelection.md) | Set the Pages wo apply the convertion.    {default: PageSelection.All} | [optional] 
**center** | **BOOLEAN** | Set or get the center mode. When set to True, the document is horizontally and vertically centered on the page.  When set to False, the document is printed to the upper left corner of the page.    {default: false} | [optional] 
**fit_page** | **BOOLEAN** | set the fit page mode. If set to True, the page is scaled to fit the image (in either width or height). If set to  False, the page is rendered with its true size.  {default: true} | [optional] 
**bits_per_pixel** | **Integer** | Get or set the color depth. Bi-tonal: 1, gray scale: 8, RGB true color: 24, CMYK: 32.    {default: 24} | [optional] 
**bilevel_threshold** | **Integer** | Set the threshold for converting from gray to bi-tonal when Dithering is eDitherNone. Value must be in  the range of 0 to 255.    {default: 181} | [optional] 
**width_pixel** | **Integer** |  | [optional] 
**height_pixel** | **Integer** |  | [optional] 
**width_point** | **Integer** |  | [optional] 
**height_point** | **Integer** |  | [optional] 
**render_options** | **Array&lt;String&gt;** | Set a specific rendering option. | [optional] 
**rotate_mode** | **String** | Set the rotation mode of the page.    Attribute: Set the rotation to the viewing rotation attribute of the PDF page, i.e. rendering the  page with the same rotation as it is displayed in a PDF viewer.    {default: Attribute} | [optional] 
**preserve_aspect_ratio** | **BOOLEAN** | If True a uniform up- or down-scaling is applied, i.e. the output image has the same ratio of width to height as the  input file and its size will fit into the defined dimensions, given by SetBitmapDimensions.    {default: true} | [optional] 
**image_quality** | **Integer** | Set the quality index of lossy compression types. This value ranges from 1 to 100 and is applied to JPEG and  JPEG2000 compression.For JPEG2000, a quality index of 100 means lossless compression.JPEG compression is  always lossy.    {default: 80} | [optional] 
**cms_engine** | **String** | Set the Color Management System (CMS) Engine.     {default: 80} | [optional] 
**custom_cms_config** | [**CustomCMSConfig**](CustomCMSConfig.md) | Set the Color Management System (CMS) Engine.     {default: 80} | [optional] 
**dithering** | **String** | Set the dithering algorithm.Dithering refers to the procedure of simulating colors or grayscales.This is mainly  useful for low color depth (e.g.black and white or indexed) images.  The supported values for TPDFDithering are listed in the corresponding enumeration.  {default: DitherFloydSteinberg} | [optional] 
**dpi** | **Integer** | &lt;p&gt;              Get or set the resolution of the image in DPI (dots per inch).              Set Both the resolutions for the x- and y-axis are set to the same value.              &lt;/p&gt;  &lt;p&gt;              Setting DPI is redundant to setting the specialized properties XDPI and YDPI.              &lt;/p&gt;  {default: 150} | [optional] 
**fill_order** | **String** | Set the bit fill order.  MSB (Most significant bit) or LSB (Least significant bit) first.    {default: MostSignificantBit} | [optional] 
**filter_ratio** | **Integer** | &lt;p&gt;              This property is used to enable and parameterize super-sampling, a technique to initially render the image at a              higher resolution and then sample it down to the target resolution.As a result of that process the final image              appears smoother, i.e.anti-aliased.              &lt;/p&gt;  &lt;p&gt;              Applying super-sampling improves the image quality when rendering at low target resolutions(72 DPI or less); the              higher the target resolution the less the visual impact.              This property requires memory and CPU time quadratically to the ratio, therefore only small values, such as 2 or 3              should be used.              &lt;/p&gt;  &lt;p&gt;              If a too high value (in combination with the original image size) is set, it is ignored.              &lt;/p&gt;  {default: 1} | [optional] 
**image_extension** | **String** | Set output Type for image file. | [optional] 
**color_space** | **String** | Set color space of the output image, see enumeration TPDFColorSpace.  For black white bi-tonal images, a gray color space must be selected    {default: ColorRGB} | [optional] 
**compression** | **String** | Get or set the compression type of TIFF images. For any other image format, the compression is automatically  defined by the file extension(the file name).  The supported values for TPDFCompression are listed in the corresponding enumeration.                {default: ComprLZW} | [optional] 
**custom_properties** | [**Array&lt;KeyValuePairStringString&gt;**](KeyValuePairStringString.md) |  | [optional] 


