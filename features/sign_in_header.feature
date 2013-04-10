Feature: Sign In Header

  In order to verify the sign in header
  As both user and visitor
  I want to evaluate when it shows or hides

  Scenario: Shows to visitor
    When I go to the home page
    Then I should see the selector "#sign_in_header"

Scenario: Hides to user
  Given I am a user
  When I go to the home page
  Then I should not see the selector "#sign_in_header"
