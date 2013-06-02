Feature: Forgot

  In order to sign in without my password
  As a visitor
  I want to create a new password

Scenario: Submits with an invalid email
  Given I am on the password forgot page
   When fill in the following:
        | Email       | invalid@invalid.com |
    And I press "Continue"
   Then I should see "We've sent password reset instructions to your email address."


Scenario: Clicks an old or invalid link
  When  I go to an invalid password reset link
   Then I should see "This link is expired."



Scenario: Valid Process
  # forgot
  Given I am on the password forgot page
    And James Pinto
   When I fill in the following:
        | Email       | james@rubyfactory.net |
    And I press "Continue"
   Then I should see "We've sent password reset instructions to your email address."

  # email
   When I go to a valid password reset link
   Then I should be on the password page

  # passwords don't match
   When I fill in the following:
        | New Password | newsecret! |
        | confirmation | aaaaaaaaa! |
    And I press "Continue"
   Then I should see "doesn't match Password"

  # new password
   When I fill in the following:
        | New Password | newsecret! |
        | confirmation | newsecret! |
    And I press "Continue"
   Then I should see "Your new password was changed, please sign in now"
    And I should be on the sign in page
