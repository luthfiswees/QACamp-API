Feature: Get Data from API

@test1
Scenario: Fetching todos
    Given I want to get todos with in "https://jsonplaceholder.typicode.com/todos"
      And I want to fetch todos data with id "1"
      And Show me the response
    Then I should get todos with id "1"
    And I should get todos with title "delectus aut autem"
    Then Response status should be "200"

@test2
Scenario: Fetching todos
    Given I want to get todos with in "https://jsonplaceholder.typicode.com/users/"
      And I want to fetch todos data with id ""
      And Show me the response
    Then I should get user with id "2"
    And I should get user with name "Ervin Howell"
    Then Response status should be "200"
