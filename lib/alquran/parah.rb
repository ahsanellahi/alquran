module Alquran
  class Parah < Base
    class << self
      def fetch(**options)
        Api::Client.fetch_parahs(filter_options(options))
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
          return show_options(options[:number]) unless options.has_key?(:collection)

          action_option = case options
            when -> (opts) { opts[:collection] === :surahs }
              { action: :surahs }
            when -> (opts) { opts[:collection] === :ayahs }
              { action: :ayahs }
            else
              raise RuntimeApiError.new
          end

          extra_options = {
            offset: options[:offset],
            limit: options[:limit],
            sajdah: options[:sajdah]
          }.compact

          options.slice(:number).merge(self.entity_option).merge(action_option).merge(extras: extra_options)
        end
    end
  end
end

