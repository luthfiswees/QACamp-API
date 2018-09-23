# Lesson 3 - API Basics

## Lesson Goals

Berikut adalah tujuan dari lesson ini
- _Mengerti apa itu API_
- _Mengerti cara menguji sebuah API_

## Struktur Proyek
Berikut adalah struktur proyek untuk Lesson 3
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

## Apa itu API?
API atau _Application Programming Interface_ adalah sebuah antarmuka/interface yang memungkinkan seorang user untuk mengambil data dari web dan mengirim data ke web melalui internet.

Dalam Lesson ini, kita akan menggunakan sebuah protokol komunikasi API bernama `REST API`. Dimana dalam pemanggilan data menggunakan command seperti `GET`, `POST`, `PUT`, `DELETE`, dan lain sebagainya. Empat command tadi termasuk command yang cukup sering digunakan.

Untuk Lesson ini, kita akan menggunakan API milik JsonPlaceholder. API ini akan mensimulasikan bagaimana kita mengambil data seorang user melalui API dengan command `GET`. Anda bisa mengaksesnya [disini](https://jsonplaceholder.typicode.com/users/1).

Kamu akan mendapatkan data dengan format seperti dibawah ini.
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

Disini bisa kita lihat bahwa kita mengambil data seorang user dengan `id` 1 melalui alamat url `https://jsonplaceholder.typicode.com/users/1 `. Karena alamat ini dapat diakses dengan command `GET`, kamu dapat mengaksesnya via browser. Tapi untuk command lain seperti `POST`, `PUT`, `DELETE`, dan sebagainya hal ini tidak dapat dilakukan. Untuk lesson pada QACamp kita akan menggunakan API milik JsonPlaceholder sebagai contoh API yang bisa dipanggil.

Sekarang asumsikan kita ingin menguji apakah alamat url ini akan selalu mengembalikan data yang sama setiap kali alamat ini dipanggil.

## Cara Menguji API
Jika kamu ingin menguji sebuah API secara manual, kamu bisa menggunakan browser (untuk command `GET` saja) atau menggunakan aplikasi bernama [Postman](https://www.getpostman.com/). Postman dapat juga digunakan untuk menguji command-command lain seperti `POST`, `PUT`, dan `DELETE`.

Akan tetapi, jika kita ingin menguji API melalui kode kita membutuhkan library tambahan agar kode kita dapat menggunakan `REST API`. Pada lesson ini saya menggunakan [Faraday](https://github.com/lostisland/faraday).

Untuk menggunakan Faraday, saya mengubah konten dari `Gemfile` saya menjadi seperti berikut.
```rb
source "https://rubygems.org"

gem 'cucumber', '~> 3.1.0'
gem 'rspec', '~> 3.7.0'
gem 'faraday', '~> 0.15.2'
```
Kemudian menjalankan command `bundle install` untuk mengenerate ulang `Gemfile.lock`.

Kemudian pada direktori `step_definitions` saya menambahkan file baru bernama `env.rb` yang memiliki isi sebagai berikut.
```rb
require 'faraday'
```
Tujuan dari file ini adalah untuk meload library Faraday ke proyek kita sehingga bisa digunakan oleh _steps_.

Kemudian, untuk file Gherkin. Sekarang kita memiliki file `api.feature` pada direktori `scenario`. Isinya adalah sebagai berikut.
```feature
Feature: Get Data from API

Scenario: Fetching user data
    Given I want to get user data from "https://jsonplaceholder.typicode.com"
    And I want to fetch user data with id "1"
    Then I should have a response with status code "200"
    And I should get user data with id "1"
    And I should get user data with name "Leanne Graham"
```
Simpelnya, skenario saya ingin menguji apakah api user dengan id `1` akan memiliki nama `Leanne Graham`.

Untuk mengimplementasikan Gherkin. Saya membuat file bernama `api_steps.rb` pada direktori `step_definitions`. Berikut adalah penjelasan implementasi dari masing-masing _step_.

#### I want to get user data from {string}
```rb
Given("I want to get user data from {string}") do |url|
    @url = "#{url}/users"
end
```
Disini saya meng-assign variable `@url` dengan alamat url dari file Gherkin

#### I want to fetch user data with id {string}
```rb
Given("I want to fetch user data with id {string}") do |id|
    @resp = Faraday.get "#{@url}/#{id}"
    @content = JSON.parse(@resp.body)
end
```
Disini saya menggunakan library Faraday untuk mengambil respons dari url menggunakan metode `GET` menggunakan fungsi milik Faraday, `Faraday.get`. kemudian melakukan parsing hasil respon untuk mendapatkan konten data dari API.

Yang saya lakukan disini kurang lebih adalah ...
- Membuat url menjadi sesuai dengan format, yaitu `  https://jsonplaceholder.typicode.com/users/1` dengan menuliskan `"#{@url}/#{id}"`
- Meminta data kepada aplikasi menggunakan `Faraday.get` dan menyimpan hasilnya di variabel `@resp`
- Mengambil konten dari data meggunakan `JSON.parse(@resp.body)` dan menyimpannya dalam variabel `@content`

#### I should have a response with status code {string}
```rb
Then("I should have a response with status code {string}") do |string|
    expect(@resp.status).to eq 200
end
```
Disini saya ingin memastikan apakah status dari respons adalah 200. Status ini menandakan kondisi dari API yang kita panggil. 200 menandakan bahwa API dalam kondisi baik.

Beberapa http status yang mungkin perlu anda ketahui:
- 200 -> OK, menandakan API baik-baik saja
- 404 -> Not Found, alamat yang dituju tidak ditemukan.
- 500 -> Internal Server Error, terdapat error pada API yang dipanggil.
- 422 -> Unprocessable Entity, Format pemanggilan API salah sehingga request tidak bisa diolah oleh API terkait.

#### I should get user data with id {string}
```rb
Then("I should get user data with id {string}") do |id|
    expect(@content['id']).to eq id.to_i
end
```
Disini saya ingin memastikan apakah nilai id sudah sesuai atau belum. Sehingga saya mengambil nilai id dari `@content` menggunakan `@content['id']` dan membandingkannya dengan variabel `id` yang diambil dari Gherkin.

#### I should get user data with name {string}
```rb
Then("I should get user data with name {string}") do |title|
    expect(@content['name']).to eq title
end
```
Disini saya ingin memastikan apakah nilai nama sudah sesuai atau belum. Sehingga saya mengambil nilai name dari `@content` menggunakan `@content['name']` dan membandingkannya dengan variabel `title` yang diambil dari Gherkin.

Berikut adalah hasil akhir dari file `api_steps.rb`.
```rb
Given("I want to get user data from {string}") do |url|
    @url = "#{url}/users"
end
  
Given("I want to fetch user data with id {string}") do |id|
    @resp = Faraday.get "#{@url}/#{id}"
    @content = JSON.parse(@resp.body)
end

Then("I should have a response with status code {string}") do |string|
    expect(@resp.status).to eq 200
end
  
Then("I should get user data with id {string}") do |id|
    expect(@content['id']).to eq id.to_i
end
  
Then("I should get user data with name {string}") do |title|
    expect(@content['name']).to eq title
end
```

## Tugas Lesson 3
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
Feature: Get Data from API

  Scenario: Fetching user data                                                # features/scenario/api.feature:3
    Given I want to get user data from "https://jsonplaceholder.typicode.com" # features/step_definitions/api_steps.rb:1
    And I want to fetch user data with id "1"                                 # features/step_definitions/api_steps.rb:5
    Then I should have a response with status code "200"                      # features/step_definitions/api_steps.rb:10
    And I should get user data with id "1"                                    # features/step_definitions/api_steps.rb:14
    And I should get user data with name "Leanne Graham"                      # features/step_definitions/api_steps.rb:18

1 scenario (1 passed)
5 steps (5 passed)
0m0.485s
```
Log ini menandakan jika skenario sudah bisa berjalan dengan baik. 



#### Selamat, anda dapat melanjutkan ke lesson selanjutnya