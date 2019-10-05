module Api
  module UrlParser
    # BASE_URL = 'api.alquranpak.com'
    BASE_URL = 'http://localhost:3001'

    def parse_url(**params)
      method_name = "handle_#{params[:entity].to_s}_urls"
      self.send(method_name, params)
    end

    def handle_parah_urls(**params)
      case params[:action]
        when :index then [BASE_URL, 'parahs'].join('/')
        when :show then [BASE_URL, 'parahs', params[:number]].join('/')
        when :surahs then [BASE_URL, 'parahs', params[:number], params[:action]].join('/')
        when :ayahs
          relative_url = [BASE_URL, 'parahs', params[:number], params[:action]].join('/')
          [relative_url, prepare_query_string(params[:extras])].join('?')
      end
    end

    def prepare_query_string(extras)
      extras.to_a.map(&:join.with('=')).join('&')
    end
  end
end
