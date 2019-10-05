Gem::Specification.new do |spec|
  spec.name           = 'alquran'
  spec.version        = '0.0.0'
  spec.date           = '2019-10-03'
  spec.summary        = 'Provides all the information regarding the Holy Quran (Book)'
  spec.description    = 'All the details can be collected of Holy Quran inclduing Parahs, Surahs, Ayahs and Transcriptions etc.'

  spec.author         = 'Ahsan Ellahi'
  spec.email          = 'ahsan.ellahi896@gmail.com'

  spec.files          = `git ls-files`.split("\n").grep(/lib/)
  spec.require_paths  = %w(lib)

  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'httparty', '~> 0.17.1'
end
