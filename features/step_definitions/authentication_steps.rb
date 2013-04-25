Given(/^pending$/) do
  pending # express the regexp above with the code you wish you had
end



#currently not being used
Given /^I am a visitor$/ do
  #I'm not a user, no action needed
end



Given /^I am a user$/ do
  username = 'jamespinto'
  email = 'james@rubyfactory.net'
  password = 'secret!'

  steps %{ 
    Given the following user records
      | first_name  | last_name | username    | email          | password |
      | James       | Pinto     | #{username} | #{email}       | #{password}  |
  }

  visit home_path
  fill_in "Email",    :with => email
  fill_in "Password", :with => password
  click_button "Connect"

  # cucumber requires all step calls to be a Given :(
  # step %{ I go to the home page }
  # step %{ I fill in "email" with "#{email}" }
  # step %{ I fill in "password" with "#{password}" }
  # step %{ I press "Connect" }
  
  # steps %{
  #   I go to the home page
  #   I fill in "email" with "#{email}"
  #   I fill in "password" with "#{password}"
  #   I press "Connect"
  # }

end


# Given /^I have one\s+user "([^\"]*)" with email "([^\"]*)" and password "([^\"]*)"$/ do |username, email, password|

#   @user = User.new :username    => username,
#                    :email       => email,
#                    :password    => password,
#                    :first_name  => "Ronald",
#                    :last_name   => "McDonald"
#   @user.save!
  
# end
