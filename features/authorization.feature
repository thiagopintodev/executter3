Feature: Authorization

  In order to verify authorization access to home page
  As both user and visitor
  I want to evaluate when it restricts access

  Scenario: As a visitor
    Given I am a visitor
    When I go to the home page
    Then I should see "access denied"

  Scenario: As a user
    Given I am a user
    When I go to the home page
    Then I should not see "access denied"
