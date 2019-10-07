require 'alquran'

RSpec.describe Alquran::Parah do
  describe 'index' do
    it do
      sleep 5
      surahs_count = Alquran::Surah.fetch.size
      expect(surahs_count).to be(114)
    end
  end

  describe 'show' do
    before :all do
      @last_surah = Alquran::Surah.fetch(number: 114)
    end

    it 'must have Ayahs' do
      expect(@last_surah).to have_key 'ayahs'
    end

    it 'check count of Ayahs in last Surah' do
      expect(@last_surah['ayahs'].size).to be(6)
    end

    it 'there must be transcription' do
      expect(@last_surah['ayahs'].last).to have_key('transcription')
    end
  end

  describe 'ayahs' do
    before :all do
      @last_surah = Alquran::Surah.fetch(number: 114, offset: 2, limit: 2)
    end

    it 'check offset' do
      expect(@last_surah.first['number']).to be(6233)
    end

    it 'check limit' do
      expect(@last_surah.size).to be(2)
    end
  end
end
