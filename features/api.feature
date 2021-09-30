@api
Feature: API call & response

  Scenario: Sending a get request
    Given I send a request to "APIPage" for all users
    Then I should get a response with the users

  Scenario: Adding a user
    Given I send a POST request to "APIPage" with user "Adam Evans"
    Then I should get a response with the new user "Adam Evans"
    And there should be a 201 status code