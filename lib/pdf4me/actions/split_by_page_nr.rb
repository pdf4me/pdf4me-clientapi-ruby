module Pdf4me
  class SplitByPageNr < WrapperAction
    attr_accessor(
      :file,
      :page_number,
      :first_pdf,
      :second_pdf
    )

    validates_presence_of :file
    validates_numericality_of :page_number

    def path
      '/Split/SplitByPageNr'
    end

    def first_pdf
      @first_pdf ||= File.join(File.dirname(file), "#{File.basename(file, ".*")}-first.pdf")
    end

    def second_pdf
      @second_pdf ||= File.join(File.dirname(file), "#{File.basename(file, ".*")}-second.pdf")
    end

    def call_api
      client.multipart_post(
        path,
        file: File.open(file, 'rb'),
        pageNr: page_number
      )
    end

    def run
      validate!
      response = call_api
      response.success?.tap do |result|
        result && save_encoded_files(response)
      end
    end

    private

    def save_encoded_files(response)
      content = parsed_json_response(response.body)

      File.open(first_pdf, 'wb') do |f|
        f.write(Base64.decode64(content[0]))
      end

      File.open(second_pdf, 'wb') do |f|
        f.write(Base64.decode64(content[1]))
      end
    end
  end
end
