module Api
  module UrlParser
    BASE_URL = 'http://api.alquranpak.com'

    RELATIVE_PARAH_PATH = 'parahs'
    RELATIVE_SURAH_PATH = 'surahs'
    RELATIVE_AYAH_PATH = 'ayahs'
    RELATIVE_EDITION_PATH = 'editions'

    def parse_url(**params)
      method_name = "handle_#{params[:entity]}_urls"
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
        when :show
          relative_url = [BASE_URL, RELATIVE_SURAH_PATH, params[:number]].join('/')
          [relative_url, prepare_query_string(params[:extras])].join('?')
        when :ayahs
          relative_url = [BASE_URL, RELATIVE_SURAH_PATH, params[:number], params[:action]].join('/')
          [relative_url, prepare_query_string(params[:extras])].join('?')
      end
    end

    def handle_ayah_urls(**params)
      case params[:action]
        when :show
          relative_url = [BASE_URL, RELATIVE_AYAH_PATH, params[:number]].join('/')
          [relative_url, prepare_query_string(params[:extras])].join('?')
        when :sajdah then [BASE_URL, RELATIVE_AYAH_PATH, :sujood].join('/')
      end
    end

    def handle_edition_urls(**params)
      [BASE_URL, RELATIVE_EDITION_PATH, params[:number]].join('/')
    end

    def prepare_query_string(extras)
      extras.to_a.map(&:join.with('=')).join('&')
    end
  end
end
