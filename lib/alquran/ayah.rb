module Alquran
  class Ayah < Base
    class << self
      def fetch(**options)
        Api::Client.fetch(filter_options(options))
      end

      private
        def show_options(options)
          edition_option = { edition: options[:edition] }.compact
          options.slice(:number).merge(self.entity_option).merge(action: :show).merge(extras: edition_option)
        end

        def filter_options(**options)
          return show_options(options) unless options.has_key?(:sajdah)

          action_option = { action: :sajdah }

          edition_option = { edition: options[:edition] }.compact

          options.slice(:number).merge(self.entity_option).merge(action_option).merge(extras: edition_option)
        end
    end
  end
end
