## Note
This documention is for Gem version 2.x.x, for documentation of Version 1.x.x, please refer the following [README](https://github.com/pdf4me/pdf4me-clientapi-ruby/tree/1-0-stable)
# pdf4me

**Pdf4me** is a PDF utility tool for Ruby and other languages.
The tool provides utility over common PDF related task like `merge`, `create`, `stamp` and others, which can be
found below.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pdf4me'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pdf4me

## Usage

## Initializing Pdf4me
Pdf4me works with any Rack application or plain old ruby script. In any regular script the configuration of Pdf4me looks like

* Require pdf4me
* Configure pdf4me with API endpoints and credentials
* Call appropriate methods.


```ruby
    require 'pdf4me'

    Pdf4me.configure do |config|
      config.host = 'api-dev.pdf4me.com'
      config.token = 'valid-token'
    end
```
## Basic Usage
> All basic methods exposes a safe and a dangerous method to execute the operation.
> If the run fails, you can get the error through `.errors`

### convert_file_to_pdf
> Given a file, convert the file to PDF. if `save_path` is not provided, the converted PDF is by defauled saved as file_name provided.

```ruby
  b = Pdf4me::ConvertFileToPdf.new(
        file: '/path/to/file/3.pdf',
        save_path: 'converted.pdf'
     )
  b.run! # dangerous method
  b.run # safe method - returns true|false

  b.errors # to show errors

```

### extract_pages
> Extract particular set of pages from given PDF

```ruby
    a = Pdf4me::ExtractPages.new(
        file: '/path/to/file/3.pdf',
        pages: [4],
        save_path: 'extracted.pdf'
    )
    a.run
```

### create_thumbnail
> Create Thumbnail from existing PDF for a particular page number.
> This takes in some additional configuration `width` defaulting to 100px, `image_format` defaulting to PNG

```ruby
    a = Pdf4me::CreateThumbnail.new(
      file: '/path/to/file/3.pdf',
      page_number: 4,
      width: 120,
      save_path: 'thumbnail.png'
    )
    a.run
```

### merge2_pdfs
> Merges two PDFs, the order of merge is defined by the arguments passed.
> * `file1` would always be the first followed by `file2` in merged PDF

```ruby
    a = Pdf4me::MergeTwoPdfs.new(
          file1: '/path/to/file/3.pdf',
          file2: '/path/to/file/4.pdf',
          save_path: 'merged.pdf'
    )
    a.run
```

###optimize_by_profile
> Optimizes a PDF based on th the profile argument passed.
>  * valid values for profile are `default`, `web`, `print`, `max`, `mRC`

```ruby
    a = Pdf4me::OptimizeByProfile.new(
          file: '/path/to/file/3.pdf',
          profile: 'max',
          save_path: 'optimized.pdf'
    )
    a.run
```


### create_pdf_a
> Creates a PDF/A Compliant document from a given PDF. By default it does not return any response.
> * valid values for compliances are `unknown`, `pdf10`, `pdf11`, `pdf12`, `pdf13`, `pdf14`, `pdfA1b`, `pdfA1a`, `pdf15`, `pdf16`, `pdf17`, `pdfA2b`, `pdfA2u`, `pdfA2a`, `pdfA3b`, `pdfA3u`, `pdfA3a`

```ruby
   a = Pdf4me::CreatePdfA.new(
        file: '/path/to/file/4.pdf',
        compliance: 'pdfA1a',
        save_path: 'to_pdfa.pdf'
   )
   a.run
```

### split_by_page_nr
> Split a given PDF into two with page number as the pivot point.

```ruby
    a = Pdf4me::SplitByPageNr.new(
          file: '/path/to/file/3.pdf',
          page_number: 3,
          first_pdf: 'first.pdf', # defaults to '/path/to/file/3-first.pdf'
          second_pdf: 'second.pdf' # defaults to '/path/to/file/3-second.pdf'
   )
    a.run
```

### text_stamp
> Stamp a PDF with a text on particular sets of pages
> Stamp takes additional arguments
> * `position_x` - Position at X-Axis, valid values are `left`, `center`, `right`
> * `position_y` - Position at Y-Axis, valid values are `top`, `middle`, `bottom`
> * text - Text to stamp the PDF with and its mandatory.

```ruby
a = Pdf4me::TextStamp.new(
      file: '/path/to/file/3.pdf',
      pages: [1, 3],
      position_x: 'left',
      position_y: 'top',
      text: 'Hell Pdf4me',
      save_path: 'stamped.pdf'
)
a.run
```


## Advanced Usage
> These methods are more complex than the Basic Wrapper methods.
>
> By default all the Advanced methods run in blocking mode -
> i.e you wait for the server to send you the response.
>
> If you want to run the operation asynchronously - you will be notified by a webhook over the result -
then please configure the notification at the dashboard
>
>See Pdf4me-Developer page to configure the webhook on application level.

###convert_to_pdf

> Given a file, convert the file to PDF, with finer controls as opposed to
`convert_file_to_pdf`. The request is instantiated as a hash with the `:req` key,
that takes in `Pdf4me::ConvertToPdf` model.

> The action takes two different models `:document`,  `:convert_to_pdf_action`  and returns
`Pdf4me::ConvertToPdfRes`

> To get more information regarding the models, please refer the provided [model definition](https://pdf4medoc.blob.core.windows.net/doc/index.html?java#converttopdfreq)

```ruby
  file_path = '/path/to/file/TestDocToConvert.docx'

  action = Pdf4me::ConvertToPdf.new(
    document: Pdf4me::Document.new(
      doc_data: Base64.encode64(File.open(file_path, 'rb', &:read)),
      name: "TestDocToConvert.docx"
    ),
    convert_to_pdf_action: Pdf4me::ConvertToPdfAction.new
  )
  response = action.run

  # saving converted file
  File.open('path/to/save.pdf', 'wb') do |f|
    f.write(Base64.decode64(response.document.doc_data))
  end
```

###optimize

> Given a PDF document, Optimize the document and return `Pdf4me::OptimizeRes`
>
> `:optimize` takes two different models `document` and `optimize_action`
>
> `Pdf4me::OptimizeAction` takes multiple arguments, important amongst them being `profile`
>  * profile, valid values are `default`, `web`, `print`, `max`, `mRC`

> The finer details on configuration can be found at the [model definition](https://pdf4medoc.blob.core.windows.net/doc/index.html?curl#optimizereq)

```ruby
    file_path = '/path/to/file/4.pdf'

    action = Pdf4me::Optimize.new(
        document: Pdf4me::Document.new(
          doc_data: Base64.encode64(File.open(file_path, 'rb', &:read))
        ),
        optimize_action: Pdf4me::OptimizeAction.new(
          use_profile: true,
          profile: 'max'
        )
    )
    response = action.run

    # saving optimized file
    File.open('path/to/optimized.pdf', 'wb') do |f|
      f.write(Base64.decode64(response.document.doc_data))
    end
```

### extract
>  Extract out pages from PDF. You can choose from the pages you want to get.

> `extract` takes two model arguments
> * `extract_action`
> * `document`

> To list all possible options for the models please refer the  [model definition](https://pdf4medoc.blob.core.windows.net/doc/index.html?curl#extractreq)

```ruby
    file_path = '/path/to/file/4.pdf'

    action = Pdf4me::Extract.new(
        document: Pdf4me::Document.new(
          doc_data: Base64.encode64(File.open(file_path, 'rb', &:read))
        ),
        extract_action: Pdf4me::ExtractAction.new(
          extract_pages: [1, 2, 5]
        )
    )
    response = action.run

    # saving extracted pages
    File.open('path/to/extracted.pdf', 'wb') do |f|
      f.write(Base64.decode64(response.document.doc_data))
    end
```

### create_images
> Creates images from the PDF Document. This is useful if you want to create thumbnails for the PDF.<br>
> The options are highly configurable to get the desired output.
> The output would be a base64 encoded object that you have to save.
> `create_images` takes two different arguments.
> * `document`
> * `image_action`

> Each model has their own set of attributes and hence can be configured further.
The full documentation of model attributes are available at [model definition](https://pdf4medoc.blob.core.windows.net/doc/index.html?curl#createimagesreq)

```ruby
    file_path = '/path/to/file/4.pdf'

    action = Pdf4me::CreateImages.new(
        document: Pdf4me::Document.new(
          doc_data: Base64.encode64(File.open(file_path, 'rb', &:read))
        ),
        image_action: Pdf4me::ImageAction.new(
            page_selection: Pdf4me::PageSelection.new(
              page_nrs: [1]
            ),
            image_extension: 'png',
            center: true,
            fit_page: true,
            bits_per_pixel: 24,
            bilevel_threshold: 181,
            render_options: %w(noAntialiasing),
            rotate_mode: 'none',
            preserve_aspect_ratio: true,
            compression: 'raw'
       )
    )
    response = action.run

    # saving the extracted thumbnail
    File.open('thumbnail.png', 'wb') do |f|
     f.write(Base64.decode64(response.document.pages.first.thumbnail))
    end
```

### merge
> Merges two or more PDF and gives MergeRes, a Base64 Encoded file
> `merge` takes two model arguments
> * `documents` - An Array of `Pdf4me::Document`
> * `merge_action` - `Pdf4me::MergeAction` model - non mandatory

> To list all possible options for the models please refer the  [model definition](https://pdf4medoc.blob.core.windows.net/doc/index.html?curl#mergereq)

```ruby

    file_path_1 = '/path/to/file/4.pdf'
    file_path_2 = '/path/to/file/3.pdf'
    file_path_3 = '/path/to/file/2.pdf'

    action = Pdf4me::Merge.new(
        documents: [
          Pdf4me::Document.new(
            doc_data: Base64.encode64(File.open(file_path_1, 'rb', &:read))
          ),
          Pdf4me::Document.new(
            doc_data: Base64.encode64(File.open(file_path_2, 'rb', &:read))
          ),
          Pdf4me::Document.new(
            doc_data: Base64.encode64(File.open(file_path_3, 'rb', &:read))
          )
        ]
    )
    response = action.run

    # saving the merged PDF
    File.open('merged.pdf', 'wb') do |f|
     f.write(Base64.decode64(response.document.doc_data))
    end
```

### pdf_a
> Creates PDF/A Documents from normal PDF document.
> `pdf_a` takes two model arguments.
> * `document` - a valid instance of `Pdf4me::Document`
> * `pdf_a_action` - a valid instance of `Pdf4me::PdfAAction`
>
> To list all possible options for the models please refer the  [model definition](https://pdf4medoc.blob.core.windows.net/doc/index.html?curl#createpdfareq)
```ruby
    file_path = '/path/to/file/4.pdf'

    action = Pdf4me::PdfA.new(
      document: Pdf4me::Document.new(
        doc_data: Base64.encode64(File.open(file_path, 'rb', &:read))
      ),
      pdf_a_action: Pdf4me::PdfAAction.new(
        compliance: 'pdfA1a',
        allowDowngrade: true,
        allowUpgrade: true,
        outputIntentProfile: 'sRGBColorSpace',
        linearize: true
      )
    )
    response = action.run

    # saving the PDF/A document
    File.open('pdf_a.pdf', 'wb') do |f|
     f.write(Base64.decode64(response.document.doc_data))
    end
```


### split
> Given a PDF, split the PDF into parts
> `split` takes up two models
> * `document` - a valid instance of `Pdf4me::Document`
> * `split_action` - a valid instance of `Pdf4me::SplitAction` which defines the number of parts the PDF splits into
>
> To list all possible options for the models please refer the  [model definition](https://pdf4medoc.blob.core.windows.net/doc/index.html?curl#splitreq)

```ruby
  file_path = '/path/to/file/4.pdf'

   action = Pdf4me::Split.new(
      document: Pdf4me::Document.new(
        doc_data: Base64.encode64(File.open(file_path, 'rb', &:read)),
      ),
      split_action: Pdf4me::SplitAction.new(
        split_after_page: 3
      )
    )
  response = action.run

  # save documents
  response.documents.each_with_index do |document, index|
    File.open("split_#{index}.pdf", 'wb') do |f|
      f.write(Base64.decode64(document.doc_data))
    end
  end
```

# stamp
> Stamp a PDF, based on Stamp Action.
> You can stamp either a text or image to PDF, There are two separate methods defined to help you with stamping
>  - Stamp PDF with image
>  - Stamp PDF with Text
> `stamp` takes two model arguments
* `document` - a valid instance of `Pdf4me::Document`
> * `stamp_action` - a valid instance of `Pdf4me::StampAction` which defines the stamp type, and position.
>
> To list all possible options for the models please refer the  [model definition](https://pdf4medoc.blob.core.windows.net/doc/index.html?curl#stampreq)

```ruby
  file_path = '/path/to/file/4.pdf'

   action = Pdf4me::Stamp.new(
      document: Pdf4me::Document.new(
        doc_data: Base64.encode64(File.open(file_path, 'rb', &:read)),
      ),
      stamp_action: Pdf4me::StampAction.new(
        image: Pdf4me::Image.new(
          image_data: Base64.encode64(File.open(image_path, 'rb', &:read)),
          recetangle: Pdf4me::Rectangle.new(width: 200, height: 200)
        ),

      )
    )
  response = action.run

  # save stamped document
  File.open('pdf_stamped.pdf', 'wb') do |f|
    f.write(Base64.decode64(response.document.doc_data))
   end
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pdf4me/pdf4me-clientapi-ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

