# Fetch book data using literal.club API
module Fetchbookdata
  extend ActiveSupport::Concern

  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'json'
  
  def fetch_book_cover(isbn13)
    url = URI("https://literal.club/graphql/")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["User-Agent"] = 'insomnia/10.1.1'
    request.body = "{\n  \"query\": \"query GetBookByIsbn($isbn13: String!) {\\n  book(where: {isbn13: $isbn13}) {\\n    cover\\n  }\\n}\\n\\n\",\n  \"operationName\": \"GetBookByIsbn\",\n  \"variables\": {\n    \"isbn13\": \"#{isbn13}\"\n  }\n}"

    response = http.request(request)
    parsed_response = JSON.parse(response.read_body)

    if parsed_response["data"]["book"]
      return parsed_response["data"]["book"]["cover"]
    end

  end
end
