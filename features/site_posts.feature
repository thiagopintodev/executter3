Feature: Site Posts

  In order to see posts on somebody's site
  As a user
  I want to see a list of posts

Scenario: With Posts
  Given the sample users
    And I am @james
    And that @james  has posted "Im @james"
    And that @ned    has posted "Im @ned"
  When  I go to @ned's site page
  Then  I should see "Eddard Stark"
    And I should see "Im @ned"
    But I should not see "Im @james"
