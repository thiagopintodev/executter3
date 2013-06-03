Feature: Menu Header

  In order to verify the sign in header
  As both user and visitor
  I want to evaluate when it shows or hides

  Scenario: Menu for visitor
    When I go to the sign in page
    Then I should see "Forgot Password?"
     And I should see "Sign Up"
     And I should see "Sign In"
    
  Scenario: Menu for user
    Given I am @james
    When I go to the home page
    Then I should see "Home"
     And I should see "@james"
     And I should see "Settings"
     And I should see "Sign Out"
