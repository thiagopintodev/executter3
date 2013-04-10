Feature: Sign In

  In order to sign in
  As a visitor
  I want to be able so sign in from various pages

  Scenario: Should see a sign in form on home and profile
    When I go to the home page
    Then I should see "Email"
      And I should see "Password"
    Given pending
    When I go to the home page
    Then I should see "Email"
      And I should see "Password"

  Scenario: Signs in with invalid credentials
    Given I go to the home page
    When I fill in the following:
      | Email     | invalid@invalid.com |
      | Password  | invalid             |
      And I press "Connect"
    Then I should see "email and password do not match"

  Scenario: Signs in with valid credentials
    Given I have one user "ronald" with email "ronald@mcdonalds.com" and password "secure"
      And I go to the home page
    When I fill in the following:
      | Email     | ronald@mcdonalds.com |
      | Password  | secure              |
      And I press "Connect"
    Then I should see "You Have Signed In."


