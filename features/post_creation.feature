Feature: Post Creation

  In order to create a post
  As a user
  I want to fill the post form correctly

  Scenario: Post a text
    Given I am @james
      And I am on the home page
    When I fill in the following:
      | Body     | lalala |
     And I press "Executter"
    Then I should see "Post was successfully created."


