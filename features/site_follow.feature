Feature: Site Follow

  In order to follow somebody
  As a user
  I want to click and follow

Scenario: As a visitor
  Given the sample users
    And I am a visitor
    And I am on @ned's site page
  When  I follow "Follow"
  Then  I should be on the sign up page

Scenario: I Follow
  Given the sample users
    And I am @james
    And I am on @ned's site page
  When  I follow "Follow"
  Then  I should see "You are now following Eddard Stark"

Scenario: I Unfollow
  Given the sample users
    And I am @james
    And that @james is following @ned
    And I am on @ned's site page
  When  I follow "unfollow"
  Then  I should see "You no longer follow Eddard Stark"

Scenario: Shouldn't follow self
  Given I am @james
    And I am on @james's site page
  When  I should not see the selector "#follow_button"
