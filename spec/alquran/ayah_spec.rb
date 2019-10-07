require 'alquran'

RSpec.describe Alquran::Ayah do
  describe 'show' do
    before :all do
      @last_ayah = Alquran::Ayah.fetch(number: 6233)
    end

    it 'must have number' do
      expect(@last_ayah).to have_key 'number'
    end

    it 'there must be transcription' do
      expect(@last_ayah).to have_key('transcription')
    end
  end
end
