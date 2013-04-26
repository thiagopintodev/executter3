Feature: Post Page

  In order to view a post
  As a visitor
  I want to see the body

  Scenario: Goes to show page
    Given the sample users
      And that @ned has posted "Im @ned"
      And I am a visitor
      And I am on ned's site page
     When I follow "Im @ned"
    Then  I should see "posts#show"



