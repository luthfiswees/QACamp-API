Feature: Get Data from API

Scenario: Fetching todos
    Given I want to get todos with in "https://jsonplaceholder.typicode.com/todos/1"
      And I want to fetch todos data
      And show me the response
    Then I should get todos with id "1"
    And I should get todos with title "delectus aut autem"
    Then response status should be "200"