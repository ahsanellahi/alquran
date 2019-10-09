# AlQuran ![build:passed](https://travis-ci.com/ahsanellahi/alquran.svg?branch=master)

Complete information of the Holy Quran.

<img src="https://img.jakpost.net/c/2018/04/11/2018_04_11_43907_1523434073._large.jpg" width="800" />

## Description

This gem provides the following infomation:
-   **Parahs**
-   **Surahs** (Chapters)
-   **Ayahs** (Verses)
-   **Transcriptions** (Translations/Tafsir provided by more than 130 authors)
-   **Editions** (General information of all the authors who worked on transcriptions)

## Installation

Install gem:

```ruby
gem install alquran
```

## Usage
```ruby
> require 'alquran'
```
##

### Parah

To fetch all parahs:
```ruby
# This will neither fetch any ayahs nor their transcriptions.
# Parahs will have only those Surahs information which begin in that particular Parah.
> Alquran::Parah.fetch
[{
  "number" => 1,
  "surahs" => [{
      "number" => 1,
      "name" => {
        "ar" => "سُورَةُ ٱلْفَاتِحَةِ", "en" => "Al-Faatiha"
      },
      "name_translations" => {
        "en" => "The Opening"
      },
      "place" => "meccan"
    },
    {
      "number" => 2,
      "name" => {
        "ar" => "سورة البقرة", "en" => "Al-Baqara"
      },
      "name_translations" => {
        "en" => "The Cow"
      },
      "place" => "medinan"
    }
  ]},
  ...
  ...
]
```

To fetch all Surahs in Parah:

```ruby
> Alquran::Parah.fetch(number: 3, collection: :surahs)
{
  "number" => 3,
  "all_surahs" => [{
      "number" => 2,
      "name" => {
        "ar" => "سورة البقرة", "en" => "Al-Baqara"
      },
      "name_translations" => {
        "en" => "The Cow"
      },
      "place" => "medinan"
    },
    {
      "number" => 3,
      "name" => {
        "ar" => "سورة آل عمران", "en" => "Aal-i-Imraan"
      },
      "name_translations" => {
        "en" => "The Family of Imraan"
      },
      "place" => "medinan"
    }
  ]
}
```
To fetch all Ayahs of Parah:
```ruby
> Alquran::Parah.fetch(number: 30, collection: :ayahs, offset: 1, limit: 3)
[{
    "number" => 5674,
    "surah_number" => 78,
    "number_in_surah" => 2,
    "content" => "عَنِ ٱلنَّبَإِ ٱلْعَظِيمِ",
    "page" => 582,
    "ruku" => 518,
    "manzil" => 7,
    "sajdah" => false
  },
  {
    "number" => 5675,
    "surah_number" => 78,
    "number_in_surah" => 3,
    "content" => "ٱلَّذِى هُمْ فِيهِ مُخْتَلِفُونَ",
    "page" => 582,
    "ruku" => 518,
    "manzil" => 7,
    "sajdah" => false
  },
  {
    "number" => 5676,
    "surah_number" => 78,
    "number_in_surah" => 4,
    "content" => "كَلَّا سَيَعْلَمُونَ",
    "page" => 582,
    "ruku" => 518,
    "manzil" => 7,
    "sajdah" => false
  }
]
```
##

### Surah

To fetch all Surahs:
```ruby
> Alquran::Surah.fetch
[{
    "number" => 1,
    "name" => {
      "ar" => "سُورَةُ ٱلْفَاتِحَةِ", "en" => "Al-Faatiha"
    },
    "name_translations" => {
      "en" => "The Opening"
    },
    "place" => "meccan"
  },
  {
    "number" => 2,
    "name" => {
      "ar" => "سورة البقرة", "en" => "Al-Baqara"
    },
    "name_translations" => {
      "en" => "The Cow"
    },
    "place" => "medinan"
  },
  ...
  ...
]
```

To fetch all Ayahs in a Surah:
```ruby
> Alquran::Surah.fetch(number: 1) # :offset and :limit can be passed with params
{
  "number" => 1,
  "name" => {
    "ar" => "سُورَةُ ٱلْفَاتِحَةِ", "en" => "Al-Faatiha"
  },
  "name_translations" => {
    "en" => "The Opening"
  },
  "place" => "meccan",
  "ayahs" => [{
    "number" => 1,
    "surah_number" => 1,
    "number_in_surah" => 1,
    "content" => "﻿بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
    "page" => 1,
    "ruku" => 1,
    "manzil" => 1,
    "sajdah" => false,
    "transcription" => [{
      "audios" => [
        "https://islamic-network.fra1.cdn.digitaloceanspaces.com/quran/audio/64/ar.minshawimujawwad/1.mp3"
      ],
      "content" => "﻿بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
      "edition" => {
        "keyword" => "ar.minshawimujawwad",
        "language" => "ar",
        "name" => {
          "ar" => "Minshawy (Mujawwad)", "en" => "Minshawy (Mujawwad)"
        },
        "format" => "audio",
        "explanation_type" => "translation"
      }
    }]
  },
  ...
  ...
  ]
}
```

To fetch ayahs for different edition:
```ruby
> Alquran::Surah.fetch(number: 1, edition: 'az.mammadaliyev') # :offset and :limit can be passed with params
...
"transcription" => [{
  "audios" => [],
  "content" => "Mərhəmətli, rəhmli Allahın adı ilə!",
  "edition" => {
    "keyword" => "az.mammadaliyev",
    "language" => "az",
    "name" => {
      "az" => "Məmmədəliyev & Bünyadov",
      "en" => "Vasim Mammadaliyev and Ziya Bunyadov"
    },
    "format" => "text",
    "explanation_type" => "translation"
  }
}]
...
```

##

### Ayahs

To fetch specific Ayah:
```ruby
> Alquran::Ayah.fetch(number: 1, edition: 'az.musayev')
{
  "number" => 1,
  "surah_number" => 1,
  "number_in_surah" => 1,
  "content" => "﻿بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
  "page" => 1,
  "ruku" => 1,
  "manzil" => 1,
  "sajdah" => false,
  "transcription" => [{
    "audios" => [],
    "content" => "Mərhəmətli və Rəhmli Allahın adı ilə!",
    "edition" => {
      "keyword" => "az.musayev",
      "language" => "az",
      "name" => {
        "az" => "Musayev", "en" => "Alikhan Musayev"
      },
      "format" => "text",
      "explanation_type" => "translation"
    }
  }]
}
```

To fetch all Sajdah Ayahs:
```ruby
> Alquran::Ayah.fetch(sajdah: true)
[{
    "number" => 1160,
    "surah_number" => 7,
    "number_in_surah" => 206,
    "content" =>
    "إِنَّ ٱلَّذِينَ عِندَ رَبِّكَ لَا يَسْتَكْبِرُونَ عَنْ عِبَادَتِهِۦ وَيُسَبِّحُونَهُۥ وَلَهُۥ يَسْجُدُونَ ۩",
    "page" => 176,
    "ruku" => 145,
    "manzil" => 2,
    "sajdah" => true,
    "transcription" => [{
      "audios" => [
        "https://islamic-network.fra1.cdn.digitaloceanspaces.com/quran/audio/64/ar.minshawimujawwad/1160.mp3"
      ],
      "content" =>
      "إِنَّ الَّذِينَ عِنْدَ رَبِّكَ لَا يَسْتَكْبِرُونَ عَنْ عِبَادَتِهِ وَيُسَبِّحُونَهُ وَلَهُ يَسْجُدُونَ ۩",
      "edition" => {
        "keyword" => "ar.minshawimujawwad",
        "language" => "ar",
        "name" => {
          "ar" => "Minshawy (Mujawwad)", "en" => "Minshawy (Mujawwad)"
        },
        "format" => "audio",
        "explanation_type" => "translation"
      }
    }]
  },
  ...
]
```

##

### Editions

To fetch all editions:
```ruby
> Alquran::Edition.fetch
[{
    "keyword" => "ar.muyassar",
    "language" => "ar",
    "name" => {
      "ar" => "تفسير المیسر", "en" => "King Fahad Quran Complex"
    },
    "format" => "text",
    "explanation_type" => "tafsir"
  },
  {
    "keyword" => "az.mammadaliyev",
    "language" => "az",
    "name" => {
      "az" => "Məmmədəliyev & Bünyadov",
      "en" => "Vasim Mammadaliyev and Ziya Bunyadov"
    },
    "format" => "text",
    "explanation_type" => "translation"
  },
  ...
  ...
]
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
