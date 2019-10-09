module Alquran
  class Edition < Base
    class << self
      def fetch(**options)
        Api::Client.fetch(filter_options(options))
      end

      private
        def filter_options(**_options)
          self.entity_option.merge(action: :index)
        end
    end
  end
end
