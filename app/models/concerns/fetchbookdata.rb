# Fetch book data using literal.club API
module Fetchbookdata
  extend ActiveSupport::Concern

  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'json'
  
  def fetch_book_cover(isbn13)
    url = URI("https://openlibrary.org/api/books")

    parameters = { :bibkeys => "ISBN:#{isbn13}", :format => "json" }

    url.query = URI.encode_www_form(parameters)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    request = Net::HTTP::Get.new(url)
    request["Content-Type"] = 'application/json'
    request["User-Agent"] = 'insomnia/10.1.1'

    response = http.request(request)

    # logger.debug "Response from API:"
    # logger.debug response.read_body

    logger.debug "Response Code:"
    logger.debug response.code

    if response.code === "200"
      parsed_response = JSON.parse(response.read_body)

      if parsed_response["ISBN:#{isbn13}"]
        thumbnail_url_small = parsed_response["ISBN:#{isbn13}"]["thumbnail_url"]
        thumbnail_url_medium = thumbnail_url_small.gsub! '-S', '-L'
        return thumbnail_url_medium
      end

    end
  end
end