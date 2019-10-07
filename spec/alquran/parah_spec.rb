require 'alquran'

RSpec.describe Alquran::Parah do
  describe 'index' do
    it do
      parahs_count = Alquran::Parah.fetch.size
      expect(parahs_count).to be(30)
    end
  end

  describe 'show' do
    before :all do
      @last_parah = Alquran::Parah.fetch(number: 30)
    end

    it 'must have Ayahs' do
      expect(@last_parah).to have_key 'ayahs'
    end

    it 'check count of Ayahs in last Parah' do
      expect(@last_parah['ayahs'].size).to be(564)
    end

    it 'there should be no transcription' do
      expect(@last_parah['ayahs'].last['transcription']).to be(nil)
    end
  end

  describe 'surahs' do
    before :all do
      @last_parah = Alquran::Parah.fetch(number: 30, collection: :surahs)
    end

    it 'check all surahs exists' do
      expect(@last_parah['all_surahs'].size).to be(38)
    end
  end

  describe 'ayahs' do
    before :all do
      @last_parah = Alquran::Parah.fetch(number: 30, collection: :ayahs, limit: 10, offset: 10)
    end

    it 'check offset' do
      expect(@last_parah.first['number']).to be(5683)
    end

    it 'check limit' do
      expect(@last_parah.size).to be(10)
    end
  end
end
