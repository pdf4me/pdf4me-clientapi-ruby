# pdf4me

**Pdf4me** is a PDF utility tool for Ruby and other languages.
The tool provides utility over common PDF related task like `merge`, `create`, `stamp` and others, which can be
found below.

## Getting Started

Add this line to your application's Gemfile:

```shell
 gem 'pdf4me'
```

And then execute
```shell
bundle install
# OR If you don't use bundler
gem install pdf4me
```

## Build locally/for development
To build the Ruby code into a gem:

```shell
gem build pdf4me.gemspec
```

Then either install the gem locally:

```shell
gem install ./pdf4me-1.0.0.gem
```

## Install from Git

You can also install from a git repository: https://github.com/pdf4me/pdf4me-clientapi-ruby.git, then add the following in the Gemfile:

    gem 'pdf4me', :git => 'https://github.com/pdf4me/pdf4me-clientapi-ruby.git'

## Initializing Pdf4me
Pdf4me works with any Rack application or plain old ruby script. In any regular script the configuration of Pdf4me looks like

* Require pdf4me
* Configure pdf4me with API endpoints and credentials
* Call appropriate methods.


```ruby
    require 'pdf4me'

    Pdf4me.configure do |config|
        config.host = 'api-dev.pdf4me.com'
        config.debugging = true
        config.app_id = 'your-app-id'
        config.app_secret = 'your-app-secret'
    end
```

## Basic Usage

### convert_file_to_pdf
> Given a file, convert the file to PDF

```ruby
    api_instance = Pdf4me::ConvertApi.new
    file = File.open(file_path, 'rb')
    response = api_instance.convert_file_to_pdf(
      file_name: 'some-name',
      file: file
    )
    file.close
```


### convert_to_pdf
> Given a file, convert the file to PDF, with finer controls as opposed to
`convert_file_to_pdf`. The request is instantiated as a hash with the `:req` key,
that takes in `Pdf4me::ConvertToPdf` model.

> The model itself is comprised of three more models, `:document`,  `:convertToPdfAction`
 and `:notification`

```ruby
    api_instance = Pdf4me::ConvertApi.new
    opts = {
      req: Pdf4me::ConvertToPdf.new(
        document: Pdf4me::Document.new(
          docData: Base64.encode64(File.open(file_path, 'rb', &:read)),
      ),
      convertToPdfAction: Pdf4me::ConvertToPdfAction.new(
        options: ""
      ),
      notification: Pdf4me::Notification.new(
        getNotification: true
      )
    )
  }
  result = api_instance.convert_to_pdf(opts)
```

### extract
>  Extract out pages from PDF. You can choose from the pages you want to extract

```ruby
    api_instance = Pdf4me::ExtractApi.new

     opts = {
      req: Pdf4me::Extract.new(
            document: Pdf4me::Document.new(
              docData: Base64.encode64(File.open(file_path, 'rb', &:read)),
            ),
            extractAction: Pdf4me::ExtractAction.new(
              extractPages: Array.wrap(pages)
            ),
            notification: Pdf4me::Notification.new(
              getNotification: true
            )
          )
     }
     api_instance.extract(opts)
```


### extract_pages
> Utility function on top of extract, that trades complexity for configuration.

```ruby
    api_instance = Pdf4me::ExtractApi.new
    response = File.open(file_path, 'rb') do |file|
      api_instance.extract_pages(
        page_nrs: '2,3,4',
        file: file
     )
    end

    # OR
    file =  File.open(file_path, 'rb')
    response = api_instance.extract_pages(
      page_nrs: '2,3',
      file: file
    )
    file.close

   # do something with response a tempfile
   FileUtils.cp(response.path, '/new/file/path.pdf')
```

### create_images
> Creates images from the PDF Document. This is useful if you want to create thumbnails for the PDF
> The options are highly configurable to get the desired output.
> The output would be a base64 encoded object that you have to save.

```ruby
    # initialize the API client
    api_instance = Pdf4me::ImageApi.new

    # make request hash
    opts = {
        req: Pdf4me::CreateImages.new(
            document: Pdf4me::Document.new(
              docData: Base64.encode64(File.open(file_path, 'rb', &:read)),
            ),
            imageAction: Pdf4me::ImageAction.new(
              pageSelection: Pdf4me::PageSelection.new(
                pageNrs: [1,2,3]
              ),
              imageExtension: 'png',
              center: true,
              fitPage: true,
              bitsPerPixel: 24,
              bilevelThreshold: 181,
              renderOptions: %w(noAntialiasing),
              rotateMode: 'none',
              preserveAspectRatio: true,
              compression: 'raw'
            ),
            notification: Pdf4me::Notification.new(
              getNotification: true
            )
        )
    }

    # response and save
    response = api_instance.create_images(opts)
    File.open(save_path, 'wb') do |f|
       f.write(Base64.decode64(response.document.doc_data))
    end
```

### create_thumbnail
> This is again a wrapper method on top of `:create_images`. The configuration is little less heckling

```ruby
    api_instance = Pdf4me::ImageApi.new
    file = File.open(file_path, 'rb')

    response = api_instance.create_thumbnail(
      100, # width in pixels
      page_nr: "1", # for which page
      image_format: "png", # image format
      file: file
    )

    file.close

    # do something with response a tempfile
    FileUtils.cp(response.path, '/new/file/path.png')
````

### merge
> Merges two or more PDF and gives MergeRes, a Base64 Encoded file

```ruby
    # Initialize the API client
    api_instance = Pdf4me::MergeApi.new

    # make request Hash
    opts = {
        req:  Pdf4me::Merge.new(
            documents: [
              Pdf4me::Document.new(
                docData: Base64.encode64(File.open(file_path, 'rb', &:read)),
              ),
              Pdf4me::Document.new(
                docData: Base64.encode64(File.open(file_path_2, 'rb', &:read)),
             ),
            ],
            mergeAction: Pdf4me::MergeAction.new,
            notification: Pdf4me::Notification.new
        )
    }

    # make request
    response = api_instance.merge(opts)
    File.open(save_path, 'wb') do |f|
      f.write(Base64.decode64(response.document.doc_data))
    end
````

### merge2_pdfs
> Utility method that merges two pdfs

```ruby
    api_instance = Pdf4me::MergeApi.new

    file1 = File.open(file_path, 'rb')
    file2 = File.open(file_path_2, 'rb')

    response = api_instance.merge2_pdfs(
        file1: file1,
        file2: file2
    )

    file1.close
    file2.close

    # do something with response a tempfile
    FileUtils.cp(response.path, '/new/file/path.pdf')
```

###optimize

> Given a PDF document, Optimize the document.
> `:optimize` takes multiple arguments, the arguments are
>
>  * profile, valid values are `default`, `web`, `print`, `max`, `mRC`
>  * dithering_mode, valid values are `none`, `floydSteinberg`, `halftone`, `pattern`, `g3Optimized`, `g4Optimized`, `atkinson`

For complete list of options, please refer the `OptimizeAction` class

```ruby
     # Initialize the API client
    api_instance = Pdf4me::OptimizeApi.new

    # prepare Request Hash
    opts = {
        req: Pdf4me::Optimize.new(
            document: Pdf4me::Document.new(
              docData: Base64.encode64(File.open(file_path, 'rb', &:read)),
            ),
            optimizeAction: Pdf4me::OptimizeAction.new(
              profile: profile,
              useProfile: true,
              optimizeResources: true,
              ditheringMode: dithering_mode
            ),
            notification: Pdf4me::Notification.new(
              getNotification: true
            )
        )
  }

  # make request
  response = api_instance.optimize(opts)
  File.open(save_path, 'wb') do |f|
    f.write(Base64.decode64(response.document.doc_data))
  end

```

###optimize_by_profile
> Utility function, that optimizes the PDF based on Profile as mentioned above

```ruby
    api_instance = Pdf4me::OptimizeApi.new
    file = File.open(file_path, 'rb')

    response = api_instance.optimize_by_profile(
      'print',
      file: file
    )
    file.close

    # do something with response a tempfile
   FileUtils.cp(response.path, '/new/file/path.pdf')
```

### pdf_a
> Creates PDF/A Documents. There are range of options that could be passed while creating the document. The options are
>   - `compliance` _string_ - Anyone of the following values `unknown`, `pdf10`, `pdf11`, `pdf12`, `pdf13`, `pdf14`, `pdfA1b`, `pdfA1a`, `pdf15`, `pdf16`, `pdf17`, `pdfA2b`, `pdfA2u`, `pdfA2a`, `pdfA3b`, `pdfA3u`, `pdfA3a`
>   - `downgrade` _boolean_ `true` or `false`
>   - `upgrade` _boolean_ `true` or `false`
>   - `linearize` _boolean_ `true` or `false`

```ruby
    api_instance = Pdf4me::PdfAApi.new

    opts = {
        req: Pdf4me::CreatePdfA.new(
            document: Pdf4me::Document.new(
              docData: Base64.encode64(File.open(file_path, 'rb', &:read)),
            ),
            pdfAAction: Pdf4me::PdfAAction.new(
              compliance: 'pdfA1a',
              allowDowngrade: true,
              allowUpgrade: true,
              outputIntentProfile: 'sRGBColorSpace',
              linearize: true
            ),
            notification: Pdf4me::Notification.new(
              getNotification: true
            )
        )
   }

    # make request
    response = api_instance.pdf_a(opts)
    File.open('/path/to/save.pdf', 'wb') do |f|
      f.write(Base64.decode64(response.document.doc_data))
    end
```

### create_pdf_a
> Utility function based on above function

```ruby
    api_instance = Pdf4me::PdfAApi.new
    file = File.open(file_path, 'rb')

    response = api_instance.create_pdf_a(
      pdf_compliance: 'pdfA1a',
      file: file
    )

   file.close

   # do something with response a tempfile
   FileUtils.cp(response.path, '/new/file/path.pdf')
```

### split
> Given a PDF, split the PDF into two parts

```ruby
    api_instance = Pdf4me::SplitApi.new

    opts = {
      req: Pdf4me::Split.new(
        document: Pdf4me::Document.new(
          docData: Base64.encode64(File.open(file_path, 'rb', &:read)),
        ),
        SplitAction: Pdf4me::SplitAction.new(
          splitAfterPage: 3
        ),
        notificaiton: Pdf4me::Notification.new(
          getNotification: true
        )
      )
    }

    response = api_instance.split(opts)

    File.open(save_path, 'wb') do |f|
        f.write(Base64.decode64(response.documents[0].doc_data))
    end

    File.open(save_path_2, 'wb') do |f|
      f.write(Base64.decode64(response.documents[0].doc_data))
   end
```


### split_by_page_nr
> Utility function to split the PDF by page number

```ruby
     api_instance = Pdf4me::SplitApi.new
     file = File.open(file_path, 'rb')

     response = api_instance.split_by_page_nr(
      2, # page_number
      file: file
     )

     file.close

     File.open(save_path, 'wb') do |f|
      f.write(Base64.decode64(response.documents[0].doc_data))
     end

     File.open(save_path_2, 'wb') do |f|
       f.write(Base64.decode64(response.documents[0].doc_data))
     end
```

# stamp
> Stamp a PDF, based on Stamp Action.
> You can stamp either a text or image to PDF, There are two separate methods defined to help you with stamping
>  - Stamp PDF with image
>  - Stamp PDF with Text
> Depending upon the type of stamp, position, size can be configured.

```ruby
    api_instance = Pdf4me::StampApi.new

    opts = {
      req: Pdf4me::Stamp.new(
        document: Pdf4me::Document.new(
          docData: Base64.encode64(File.open(file_path, 'rb', &:read)),
        ),
        stampAction: Pdf4me::StampAction.new(
          image: Pdf4me::Image.new(
            imageData: Base64.encode64(File.open(image, 'rb', &:read)),
          ),
          sizeX: stamp_width,
          sizeY: stamp_length,
          rotate: rotate,
          alignX: align_x,
          alignY: align_y,
          scale: 'relToA4',
          stampType: 'foreground',
          alpha: opacity
        ),
        notification: Pdf4me::Notification.new(
          getNotification: true
        )
      )
    }

    response = api_instance.stamp(opts)
    File.open(save_path_2, 'wb') do |f|
      f.write(Base64.decode64(response.document.doc_data))
    end
```

### text_stamp
> Utility function over stamp, where you can stamp a document with text

```ruby
    api_instance = Pdf4me::StampApi.new
    file = File.open(file_path, 'rb')

    response = api_instance.text_stamp(
      'right', # alignment x axis
      'bottom', # alignment y axis,
       text: 'Hello world, i am stamp',
       pages: '1,4',
       file: file
    )
    file.close

    # do something with response a tempfile
    FileUtils.cp(response.path, '/new/file/path.pdf')
```
