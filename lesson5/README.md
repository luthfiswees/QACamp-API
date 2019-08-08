# Lesson 5 - Scenario Outline

## Lesson Goals

Berikut adalah tujuan dari lesson ini
- _Mengerti apa itu Scenario Outline_
- _Mengerti cara menggunakan Scenario Outline_

## Struktur Proyek
Berikut adalah struktur proyek untuk Lesson 5
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

## Apa itu Scenario Outline
_Scenario Outline_ adalah fitur dari Gherkin yang dapat mempersingkat penulisan skenario dengan menggunakan tabel.

Misalkan saya memiliki skenario seperti ini
```feature
Feature: Calculator
  As a user
  I want to use a calculator to add numbers
  So that I don't need to add myself
 
  Scenario: Add two numbers -2 & 3
    Given I have a calculator
    When I add -2 and 3
    Then the result should be 1
    
  Scenario: Add two numbers 10 & 15
    Given I have a calculator
    When I add 10 and 15
    Then the result should be 25
```

Saya bisa menggunakan _scenario outline_ untuk menyederhanakan skenario tersebut menjadi seperti berikut.
```feature
Feature: Calculator
  As a user
  I want to use a calculator to add numbers
  So that I don't need to add myself
 
  Scenario Outline: Add two numbers <num1> & <num2>
    Given I have a calculator
    When I add <num1> and <num2>
    Then the result should be <total>
 
  Examples: 
    | num1 | num2 | total |
    | -2   |  3   |   1   |
    | 10   |  15  |   25  |
```

## Cara Menggunakan Scenario Outline
Pada proyek kita sudah memiliki skenario Gherkin sebagai berikut
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
Pada skenario ini saya sudah berhasil mengimplementasi kode yang mengecek value `street` menggunakan JSONPath. Tapi saya ingin mengubah skenario ini agar mampu juga membaca value `suite`, `city`, dan `zipcode` dengan JSONPath. Hal ini bisa diimplementasikan dengan menggunakan kembali _step_ yang sudah ada.
```feature
Feature: Get Data from API

Scenario: Fetching user data
    Given I want to get user data from "https://jsonplaceholder.typicode.com"
    And I want to fetch user data with id "1"
    Then I should have a response with status code "200"
    And I should get user data with id "1"
    And I should get user data with name "Leanne Graham"
    And I should get element in "$.address.street" to have value "Kulas Light"
    And I should get element in "$.address.suite" to have value "Apt. 556"
    And I should get element in "$.address.city" to have value "Gwenborough"
    And I should get element in "$.address.zipcode" to have value "92998-3874"
```

Atau menggunakan _Scenario Outline_ sebagai berikut
```feature
Feature: Get Data from API

Scenario Outline: Fetching user data
    Given I want to get user data from "https://jsonplaceholder.typicode.com"
    And I want to fetch user data with id "1"
    Then I should have a response with status code "200"
    And I should get user data with id "1"
    And I should get user data with name "Leanne Graham"
    And I should get element in <jsonpath> to have value <value>

Examples:
    |      jsonpath       |     value     |
    | "$.address.street"  | "Kulas Light" |
    | "$.address.suite"   | "Apt. 556"    |
    | "$.address.city"    | "Gwenborough" |
    | "$.address.zipcode" | "92998-3874"  |
```

## Tugas Lesson 5
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

  Scenario Outline: Fetching user data                                        # features/scenario/api.feature:3
    Given I want to get user data from "https://jsonplaceholder.typicode.com" # features/scenario/api.feature:4
    And I want to fetch user data with id "1"                                 # features/scenario/api.feature:5
    Then I should have a response with status code "200"                      # features/scenario/api.feature:6
    And I should get user data with id "1"                                    # features/scenario/api.feature:7
    And I should get user data with name "Leanne Graham"                      # features/scenario/api.feature:8
    And I should get element in <jsonpath> to have value <value>              # features/scenario/api.feature:9

    Examples:
      | jsonpath            | value         |
      | "$.address.street"  | "Kulas Light" |
      | "$.address.suite"   | "Apt. 556"    |
      | "$.address.city"    | "Gwenborough" |
      | "$.address.zipcode" | "92998-3874"  |

4 scenarios (4 passed)
24 steps (24 passed)
0m0.684s
```
Log ini menandakan jika skenario sudah bisa berjalan dengan baik. 



#### Selamat, anda dapat melanjutkan ke lesson selanjutnya