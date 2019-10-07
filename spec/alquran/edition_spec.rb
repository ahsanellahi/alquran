require 'alquran'

RSpec.describe Alquran::Edition do
  describe 'index' do
    before :all do
      @editions = Alquran::Edition.fetch
    end

    it 'must have number' do
      expect(@editions.size).to be(135)
    end
  end
end
