require_relative 'url_parser'

module Api
  class Client
    extend UrlParser

    class << self
      def get
        hello
      end
    end
  end
end
