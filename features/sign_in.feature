Feature: Sign In

  In order to sign in
  As a visitor
  I want to be able so sign in from various pages

  Scenario: Signs in with invalid credentials
    Given I go to the sign in page
    When I fill in the following:
      | Email     | invalid@invalid.com |
      | Password  | invalid             |
      And I press "Connect"
    Then I should see "email and password do not match"

  Scenario: Signs in with valid credentials
    Given James Pinto
      And I am on the sign in page
    When  I fill in the following:
      | Email     | james@rubyfactory.net |
      | Password  | secure!               |
      And I press "Connect"
    Then I should see "You Have Signed In."


