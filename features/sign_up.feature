Feature: Sign Up

  In order to sign up
  As a visitor
  I want to be able so sign up from the root page

Scenario: Signs up with valid information
  Given I go to the home page
  When I fill in the following:
    | First name  | James                 |
    | Last name   | Pinto                 |
    | Username    | jamespinto            |
    #| City        | brasilia              |
    | E-mail       | james@rubyfactory.net |
    | Password    | secret!               |
    And I select "male" from "Gender"
    And I select "1988-02-20" as the user "born_on" date
    And I press "Sign Up"
  Then I should see "Welcome to Executter!"

#TODO: write more scenarios