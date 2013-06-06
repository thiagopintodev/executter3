Feature: Site Followers

  In order to see a site's followers
  As a user
  I want to see a list of followers

Scenario: Standard Scenario (ignoring friends)
  Given the sample users
    And I am a visitor
    And that @cerci is following @ned
    And that @jamie is following @ned
   When I go to @ned's site page
    And I should see the selector ".follower_jamie"
    And I should see the selector ".follower_cerci"
    But I should not see the selector ".follower_bran"
    And I should see "2 Follow"
    And I should see "Following 0"
