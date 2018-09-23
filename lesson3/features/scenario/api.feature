Feature: Get Data from API

Scenario: Fetching todos
    Given I want to get todos with in "https://jsonplaceholder.typicode.com/todos"
      And I want to fetch todos data with id "1"
      And Show me the response
    Then I should get todos with id "1"
    And I should get todos with title "delectus aut autem"
    Then Response status should be "200"