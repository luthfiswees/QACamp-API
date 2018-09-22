# Lesson 1 - Gherkin Basics

## Lesson Goals

Berikut adalah tujuan dari lesson ini
- _Mengerti struktur file Gherkin_
- _Mengerti cara menggunakan file Gherkin_

## Struktur Proyek
Berikut adalah struktur proyek untuk Lesson 1
```bash
├── Gemfile
├── Gemfile.lock
└── features
    └── scenario
        └── add_operations.feature
```

## Pengenalan Gherkin
Pertama coba lihat konten dari file `add_operations.feature` yang berisi _test case_ mengenai operasi penjumlahan. Ini adalah contoh file gherkin pada projek kita kali ini.

```feature
Feature: Add Numbers

Scenario: Additions
    Given a number "5"
    And number "3"
    Then we should add them and have "8"
```

Simpelnya, file Gherkin adalah sebuah file berekstensi `.feature` yang berisi `Scenario`. Setiap pernyataan pada `Scenario` diawali oleh kata `Given`, `When`, `And`, atau `Then`. Pernyataan ini biasa disebut sebagai _step_. _Step_ memiliki struktur kurang lebih sebagai berikut ...

- `Given` "mendeskripsikan konteks"
- `When` "mendeskripsikan aksi"
- `Then` "mendeskripsikan hasil yang diharapkan"

Setiap _step_ perlu diimplementasikan (dalam hal ini menggunakan Ruby). Pada proyek ini, tidak terdapat implementasi. Sehingga akan keluar _error log_. 

Log ini akan memberikan kita petunjuk bagaimana _step_ tersebut akan diimplementasikan. Log ini akan menjadi basis kita untuk mengimplementasikan _step_ pada Lesson 2.

## Tugas Lesson 1

Install dahulu dependensi menggunakan command berikut
```bash
bundle install
```

Kemudian coba jalankan scenario Gherkin dengan menjalankan command cucumber
```bash
bundle exec cucumber
```

Maka kamu akan mendapatkan hasil berupa log sebagai berikut ...

```sh
Feature: Add Numbers

  Scenario: Additions                    # features/scenario/add_operations.feature:3
    Given a number "5"                   # features/scenario/add_operations.feature:4
    And number "3"                       # features/scenario/add_operations.feature:5
    Then we should add them and have "8" # features/scenario/add_operations.feature:6

1 scenario (1 undefined)
3 steps (3 undefined)
0m0.036s

You can implement step definitions for undefined steps with these snippets:

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

Berikut adalah penjelasan mengenai cara membaca log ini.

```sh
Feature: Add Numbers

  Scenario: Additions                    # features/scenario/add_operations.feature:3
    Given a number "5"                   # features/scenario/add_operations.feature:4
    And number "3"                       # features/scenario/add_operations.feature:5
    Then we should add them and have "8" # features/scenario/add_operations.feature:6

1 scenario (1 undefined)
3 steps (3 undefined)
0m0.036s
```

Pada bagian ini, dijelaskan bahwa script yang kita jalankan memiliki tepat 1 `Scenario` dan 3 `step`.

```sh
You can implement step definitions for undefined steps with these snippets:

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

Kemudian pada bagian ini dijelaskan bahwa _step_ dapat diimplementasikan dengan menggunakan template dari log ini. Ini akan dilanjutkan pada Lesson 2.



#### Selamat, anda dapat melanjutkan ke lesson selanjutnya