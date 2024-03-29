Feature: Home Feed

  In order to see posts from my followings
  As a user
  I want to see a list of posts

Scenario: Follows some people
  Given the sample users
    And I am @james
    And that @james is following @ned and @cerci
    And that @james  has posted "Im @james"
    And that @ned    has posted "Im @ned"
    And that @cerci  has posted "Im @cerci"
    And that @bran   has posted "Im @bran"
  When  I go to the home page
  Then  I should see "Im @james"
    And I should see "Im @ned"
    And I should see "Im @cerci"
    And I should see "Im @ned"
    But I should not see "Im @bran"