Feature: Authorization

  In order to verify authorization access to home page
  As both user and visitor
  I want to evaluate when it restricts access

  Scenario: As a visitor, cannot go to home page
    Given I am a visitor
     When I go to the home page
     Then I should see "You need to log in"
      And I should be on the sign up page

  Scenario: As a user, can go to home page
    Given I am @james
     When I go to the home page
     Then I should be on the home page

  Scenario: As a user, goes to sign up page
    Given I am @james
     When I go to the sign up page
     Then I should see "You are already logged in."

  Scenario: Remove a post as a user
    Given the sample users
      And I am @james
      And that @ned has posted "Im @ned"
    When  I am on the latest post page
     Then I should not see "delete"
      But that @james has posted "Im @james"
    When  I am on the latest post page
     Then I should see "delete"
