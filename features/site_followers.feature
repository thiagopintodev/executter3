Feature: Site Followers

  In order to see a site's followers
  As a user
  I want to see a list of followers

Scenario: Standard Scenario (ignoring friends)
  Given the sample users
    And I am a visitor
    And that @cerci is following @ned
    And that @james is following @ned
  When  I go to @ned's site page
  Then  I should see "@ned's followers"
    And I should see "James Lannister"
    And I should see "Cerci Lannister"
    But I should not see "Bran Stark"

