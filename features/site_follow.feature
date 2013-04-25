Feature: Site Follow

  In order to follow somebody
  As a user
  I want to click and follow

Scenario: As a visitor
  Given the sample users
    And I am a visitor
    And I am on @ned's site page
  When  I follow "Follow Eddard Stark"
  Then  I should be on the root page

Scenario: I Follow
  Given the sample users
    And I am a user
    And I am on @ned's site page
  When  I follow "Follow Eddard Stark"
  Then  I should see "You are now following Eddard Stark"

Scenario: I Unfollow
  Given the sample users
    And I am a user
    And that @jamespinto is following @ned
    And I am on @ned's site page
  When  I follow "Unfollow Eddard Stark"
  Then  I should see "You no longer follow Eddard Stark"

