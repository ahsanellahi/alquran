module Alquran
  class Surah < Base
    class << self
      def fetch(**options)
        Api::Client.fetch_surahs(filter_options(options))
      end

      private
        def index_options
          self.entity_option.merge(action: :index)
        end

        def show_options(number)
          self.entity_option.merge(action: :show, number: number)
        end

        def filter_options(**options)
          return index_options unless options.has_key?(:number)
          return show_options(options[:number]) unless has_extra_option?(options)

          action_option = { action: :ayahs }

          extra_options = {
            offset: options[:offset],
            limit: options[:limit],
            edition: options[:edition],
            sajdah: options[:sajdah]
          }.compact

          options.slice(:number).merge(self.entity_option).merge(action_option).merge(extras: extra_options)
        end

        def has_extra_option?(options)
          not available_extra_options.map(&options).compact.empty?
        end

        def available_extra_options
          %i(offset limit sajdah)
        end
    end
  end
end
