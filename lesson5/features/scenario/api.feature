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