# Lesson 4 - JSONPath

## Lesson Goals

Berikut adalah tujuan dari lesson ini
- _Mengerti apa itu JSONPath_
- _Mengerti cara menggunakan JSONPath_

## Struktur Proyek
Berikut adalah struktur proyek untuk Lesson 4
```sh
├── Gemfile
├── Gemfile.lock
└── features
    ├── scenario
    │   └── api.feature
    └── step_definitions
        ├── api_steps.rb
        └── env.rb
```

## Apa itu JSONPath
JSONPath adalah sebuah standar untuk mengambil data tertentu dari data berbentuk JSON. Data yang kita dapatkan dari API `  https://jsonplaceholder.typicode.com/users/1` berformat JSON. Kita bisa memanfaatkan JSONPath untuk mengambil nilai-nilai tertentu pada data. Untuk pemahaman lebih mendetail, anda bisa membaca [ini](http://goessner.net/articles/JsonPath/).

Sebagai contoh misalkan kita memiliki data sebagai berikut.
```
{
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    "geo": {
      "lat": "-37.3159",
      "lng": "81.1496"
    }
  },
  "phone": "1-770-736-8031 x56442",
  "website": "hildegard.org",
  "company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
  }
}
```
- Misalkan saya ingin mengambil nilai `id`, saya bisa mengambil datanya dengan JSONPath `$.id`
- Misalkan saya ingin mengambil nilai `street`, saya bisa mengambil datanya dengan JSONPath `$.address.street`
- Misalkan saya ingin mengambil nilai `phone`, saya bisa mengambil datanya dengan JSONPath `$.phone`
- Misalkan saya ingin mengambil nilai `lat`, saya bisa mengambil datanya dengan JSONPath `$.address.geo.lat`
- Dan sebagainya ...

## Cara Menggunakan JSONPath
Dalam proyek ini saya menggunakan library [ini](https://github.com/joshbuddy/jsonpath) untuk mengimplementasikan JSONPath.

Dalam `Gemfile`, saya menambahkan dependensi JSONPath.
```rb
source "https://rubygems.org"

gem 'cucumber', '~> 3.1.0'
gem 'rspec', '~> 3.7.0'
gem 'faraday', '~> 0.15.2'
gem 'jsonpath', '~> 0.8.7'
```

Kemudian, saya menambahkan juga dependensi `jsonpath` ke file `env.rb`
```rb
require 'faraday'
require 'jsonpath'
```

Pada Gherkin, saya menambahkan _step_ `And I should get element in "$.address.street" to have value "Kulas Light"`.
```feature
Feature: Get Data from API

Scenario: Fetching user data
    Given I want to get user data from "https://jsonplaceholder.typicode.com"
    And I want to fetch user data with id "1"
    Then I should have a response with status code "200"
    And I should get user data with id "1"
    And I should get user data with name "Leanne Graham"
    And I should get element in "$.address.street" to have value "Kulas Light"
```

Selanjutnya, saya menambahkan _step_ `I should get element in {string} to have value {string}`. Dan menambahkan implementasinya sebagai berikut.
```rb
Then("I should get element in {string} to have value {string}") do |json_path, value|
    results = JsonPath.new(json_path).on(@content).to_a.map(&:to_s)[0]
    expect(results).to eq value
end
```
Yang saya lakukan dalam implementasi ini kurang lebih adalah ...
- Mengkonversi elemen dari `@content` dan mencari elemen yang dituju oleh notasi `json_path`. Kemudian menyimpan hasilnya pada variabel `results`.
- Membandingkan nilai `result` dengan variabel `value` yang diambil dari file Gherkin.

## Tugas Lesson 4
Install dahulu dependensi menggunakan command berikut
```bash
bundle install
```

Kemudian coba jalankan scenario dengan menjalankan command cucumber
```bash
bundle exec cucumber
```

Maka kamu akan mendapatkan hasil berupa log sebagai berikut ...
```sh
Scenario: Fetching user data                                                 # features/scenario/api.feature:3
    Given I want to get user data from "https://jsonplaceholder.typicode.com"  # features/step_definitions/api_steps.rb:1
    And I want to fetch user data with id "1"                                  # features/step_definitions/api_steps.rb:5
    Then I should have a response with status code "200"                       # features/step_definitions/api_steps.rb:10
    And I should get user data with id "1"                                     # features/step_definitions/api_steps.rb:14
    And I should get user data with name "Leanne Graham"                       # features/step_definitions/api_steps.rb:18
    And I should get element in "$.address.street" to have value "Kulas Light" # features/step_definitions/api_steps.rb:22

1 scenario (1 passed)
6 steps (6 passed)
0m1.457s
```
Log ini menandakan jika skenario sudah bisa berjalan dengan baik. 



#### Selamat, anda dapat melanjutkan ke lesson selanjutnya