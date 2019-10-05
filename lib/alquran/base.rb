module Alquran
  class Base
    class << self
      protected
        def entity_option
          { entity: self.name.demodulize.downcase.to_sym }
        end
    end
  end
end
