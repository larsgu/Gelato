@todo
Feature: ToDo App
  Scenario: Adding ToDo item

    Given I go to "ToDoPage"
    When I enter item name "Check item can be added" into the new item input field
    Then the #1 item element should have text as "Check item can be added"
    When I check the checkbox for item #1
    Then the checkbox should be checked for item #1
    When I uncheck the checkbox for item #1
    Then the checkbox should be unchecked for item #1
    When I delete item #1
    Then the #1 item should not be present

  Scenario: Adding several ToDo items
    Given I go to "ToDoPage"
    When I enter item name "Get started" into the new item input field
    Then the #1 item element should have text as "Get started"
    When I enter item name "Move on" into the new item input field
    Then the #2 item element should have text as "Move on"
    When I enter item name "Start doing" into the new item input field
    Then the #3 item element should have text as "Start doing"
    When I check the checkbox for item #3
    Then the checkbox should be checked for item #3
    When I check the checkbox for item #2
    Then the checkbox should be checked for item #2
    When I delete item #2
    Then the #2 item element should not have text as "Move on"