Feature: Sign In

  In order to sign in
  As a visitor
  I want to be able so sign in from various pages

  Scenario: Signs in with invalid email
    Given I go to the home page
    When I fill in the sign in header with the following:
      | Email     | invalid@invalid.com |
      | Password  | invalid             |
      And I press "Connect"
    Then I should see "email and password do not match"

  Scenario: Signs in with invalid password
    Given James Pinto
    Given I go to the home page
    When  I fill in the sign in header with the following:
      | Email     | james@rubyfactory.net |
      | Password  | invalid               |
      And I press "Connect"
    Then I should see "email and password do not match"

  Scenario: Signs in with valid credentials
    Given James Pinto
    Given I go to the home page
    When  I fill in the sign in header with the following:
      | Email     | james@rubyfactory.net |
      | Password  | secure!               |
      And I press "Connect"
    Then  I should see "You Have Signed In."

  Scenario: In the sign in box
    Given James Pinto
      And I am on the sign in page
    When  I fill in the sign in box with the following:
      | Email     | james@rubyfactory.net |
      | Password  | secure!               |
      And I press "Connect"
    Then  I should see "You Have Signed In."


