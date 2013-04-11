Feature: Sign Up

  In order to sign up
  As a visitor
  I want to be able so sign up from the root page

Scenario: Signs up with valid information
  Given I go to the home page
  When I fill in the following:
    | First Name  | James                 |
    | Last Name   | Pinto                 |
    | Username    | jamespinto            |
    | City        | brasilia              |
    | Email       | james@rubyfactory.net |
    | Password    | secret!               |
    | Sex         | Boy                   |
    | Born At     | 1988-02-20            |
    And I press "Sign Up"
  Then I should see "Your Account has been created"

#TODO: write more scenarios