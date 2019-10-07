module Api
  module UrlParser
    # BASE_URL = 'http://api.alquranpak.com'
    BASE_URL = 'http://localhost:3001'
    RELATIVE_PARAH_PATH = 'parahs'
    RELATIVE_SURAH_PATH = 'surahs'

    def parse_url(**params)
      method_name = "handle_#{params[:entity].to_s}_urls"
      self.send(method_name, params)
    end

    def handle_parah_urls(**params)
      case params[:action]
        when :index then [BASE_URL, RELATIVE_PARAH_PATH].join('/')
        when :show then [BASE_URL, RELATIVE_PARAH_PATH, params[:number]].join('/')
        when :surahs then [BASE_URL, RELATIVE_PARAH_PATH, params[:number], params[:action]].join('/')
        when :ayahs
          relative_url = [BASE_URL, RELATIVE_PARAH_PATH, params[:number], params[:action]].join('/')
          [relative_url, prepare_query_string(params[:extras])].join('?')
      end
    end

    def handle_surah_urls(**params)
      case params[:action]
        when :index then [BASE_URL, RELATIVE_SURAH_PATH].join('/')
        when :show then [BASE_URL, RELATIVE_SURAH_PATH, params[:number]].join('/')
        when :ayahs
          relative_url = [BASE_URL, RELATIVE_SURAH_PATH, params[:number], params[:action]].join('/')
          [relative_url, prepare_query_string(params[:extras])].join('?')
      end
    end

    def prepare_query_string(extras)
      extras.to_a.map(&:join.with('=')).join('&')
    end
  end
end
