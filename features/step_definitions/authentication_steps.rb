Given(/^pending$/) do
  pending # express the regexp above with the code you wish you had
end


Given /^I am a visitor$/ do
  #I'm not a user, no action needed
  #currently not being used
end

Given /^I am a user$/ do
  username = 'example'
  email = 'example@example.com'
  password = 'secret!'

  steps %{
    I have one user "#{username}" with email "#{email}" and password "#{password}"
    I go to the home page
    I fill in "username" with "#{username}"
    I fill in "password" with "#{password}"
    I press "Sign in"
  }
end


Given /^I have one\s+user "([^\"]*)" with email "([^\"]*)" and password "([^\"]*)"$/ do |username, email, password|

  @user = User.new :username    => username,
                   :email       => email,
                   :password    => password,
                   :first_name  => "Ronald",
                   :last_name   => "McDonald"
  @user.save!
  
end
