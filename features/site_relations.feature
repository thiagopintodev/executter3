Feature: Site Relations

  In order to see a site's relation stats
  As a user
  I want to see a list of counters

Scenario: Standard Scenario (ignoring friends)
  Given the sample users
    And I am a visitor
    And that @ned is following @cerci
    And that @cerci is following @ned
    And that @jamie is following @ned
  When  I go to @ned's site page
  Then  I should see "Eddard Stark"
    And I should see "1 followings"
    And I should see "2 followers"
    And I should not see "0 friends"

