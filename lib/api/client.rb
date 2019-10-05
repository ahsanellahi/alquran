module Api
  class Client
    extend UrlParser

    class << self
      def fetch_parahs(**options)
        get(parse_url(options))
      end

      private
        def get(url)
          response = HTTParty.get(url, headers: headers)
          handle_request_response(response)
        end

        def handle_request_response(response)
          case response.code
            when 200..201 then JSON.parse(response.body)
            else raise RuntimeApiError.new
          end
        end

        def headers
          { 'Accept': 'application/alquran; v1' }
        end
    end
  end
end
