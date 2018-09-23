# Lesson 2 - Cucumber Ruby Basics

## Lesson Goals

Berikut adalah tujuan dari lesson ini
- _Mengerti apa itu Cucumber_
- _Mengerti struktur direktori Cucumber_
- _Mengerti cara menggunakan Cucumber_
- _Mengerti cara mengimplementasikan steps_

## Struktur Proyek
Berikut adalah struktur proyek untuk Lesson 2
```sh
├── Gemfile
├── Gemfile.lock
└── features
    ├── scenario
    │   └── add_operations.feature
    └── step_definitions
        └── operations_step.rb
```

## Struktur Proyek Cucumber

`Cucumber` disusun sesuai dengan proyek Ruby secara umum, dimana terdapat `Gemfile` dan `Gemfile.lock` yang berisi daftar dependensi yang dibutuhkan oleh proyek.

Dalam sebuah proyek Ruby, biasanya digunakan sebuah tools untuk mengatur dependensi library yang bernama `bundler`. Command-command yang dipakai sebelumnya seperti `bundle`, `bundle install`, dan sebagainya merupakan command milik `bundler`. `Gemfile` digunakan oleh `bundler` untuk menentukan library apa saja yang perlu di-install pada suatu proyek Ruby. 

Dalam `Gemfile` proyek ini sendiri terdapat dependensi untuk `cucumber` (versi 3.1.0) dan library `rspec` (versi 3.7.0).
```
source "https://rubygems.org"

gem 'cucumber', '~> 3.1.0'
gem 'rspec', '~> 3.7.0'
```
Jika anda tertarik untuk memahami bagaimana cara membuat `Gemfile` secara mendalam, anda bisa membaca lebih jauh [disini](https://bundler.io/gemfile.html).

Kemudian, direktori yang dibutuhkan oleh `cucumber` untuk dapat berjalan dengan baik adalah direktori `scenario` dan direktori `step_definitions`. Direktori `scenario` adalah tempat untuk menaruh file gherkin, sedangkan direktori `step_definitions` adalah tempat untuk menaruh file step (dalam ekstensi ruby atau `.rb`).

Penamaan file gherkin bebas asalkan diakhiri dengan ekstensi `.feature`. Untuk _steps_, Nama file bebas yang diakhiri dengan akhiran `_step.rb` (Contoh: `operations_step.rb`).

## Cara Implementasi _Steps_

Dari log pada lesson 1, kita mendapatkan template untuk mengimplementasikan _steps_ sebagai berikut.

```rb
Given("a number {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Given("number {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("we should add them and have {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
```

Kemudian saya membuat file bernama `operations_step.rb` dalam direktori `step_definitions`. Kemudian saya mulai mengimplementasikan _step_ pertama, yaitu `"a number {string}"`

```rb
Given("a number {string}") do |number_1|
    @result = number_1.to_i
end
```

Saya ingin menyimpan hasil penjumlahan saya pada sebuah variabel bernama `@result`. Sehingga saya masukkan value angka pertama saya pada variabel `@result`.

```rb
Given("number {string}") do |number_2|
    @result = @result + number_2.to_i
end
```

Kemudian, untuk angka kedua. Jumlahkan dengan isi dari variabel `@result` sebelumnya.

```rb
Then("we should add them and have {string}") do |result|
    expect(@result).to eq result.to_i
end
```

Kemudian, setelah berhasil dijumlahkan. Saya ingin memastikan bahwa hasil yang didapat sesuai dengan yang diharapkan. Maka dilakukan pengecekan menggunakan metode `expect`.

Jika anda cukup familiar dengan `rspec`, syntax `expect` sama cara penggunaanya dengan metode `expect` pada `rspec`.

Sehingga, jika dilihat secara keseluruhan. Isi file `operations_step.rb` berubah menjadi ..,

```rb
Given("a number {string}") do |number_1|
    @result = number_1.to_i
end
  
Given("number {string}") do |number_2|
    @result = @result + number_2.to_i
end
  
Then("we should add them and have {string}") do |result|
    expect(@result).to eq result.to_i
end
```

## Tugas Lesson 2

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
Feature: Add Numbers

  Scenario: Additions                    # features/scenario/add_operations.feature:3
    Given a number "5"                   # features/step_definitions/operations_step.rb:1
    And number "3"                       # features/step_definitions/operations_step.rb:5
    Then we should add them and have "8" # features/step_definitions/operations_step.rb:9

1 scenario (1 passed)
3 steps (3 passed)
0m0.038s
```

Log telah berubah yang menandakan bahwa skenario yang dijalankan sudah terimplementasi dan hasil tes sesuai dengan yang diharapkan.



#### Selamat, anda dapat melanjutkan ke lesson selanjutnya