Feature: Site Posts

  In order to see posts on somebody's site
  As a user
  I want to see a list of posts

Scenario: Follows no one
  Given the sample users
    And I am a user
    And that @jamespinto  has posted "Im @jamespinto"
    And that @ned         has posted "Im @ned"
  When  I go to @ned's site page
  Then  I should see "Eddard Stark"
    And I should see "posts by @ned (Eddard Stark)"
    And I should see "Im @ned"
    But I should not see "Im @jamespinto"