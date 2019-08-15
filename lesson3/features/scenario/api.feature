Feature: Get Data from API

Scenario: Fetching todos
    Given I want to get user with in "https://jsonplaceholder.typicode.com/users"
      And I want to fetch user data with id "2"
      And Show me the response
    Then I should get user with id "2"
    And I should get user with name "Ervin Howell"
    And I should get user with username "Antonette"
    And I should get user address with street "Victor Plains"
    And I should get user address with geo lat "-43.9509"
    Then Response status should be "200"