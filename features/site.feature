Feature: Site

  In order to see the owner from a site
  As a user
  I want to see the owner's full name

Scenario: Follows no one
  Given the sample users
    And I am a user
  When  I go to @ned's site page
  Then  I should see "Eddard Stark"
    And I should see "posts by @ned"

# Scenario: 
#   Given the sample users
#     And I am a user
#   When I go to the home page
#   Then I should see "..."


