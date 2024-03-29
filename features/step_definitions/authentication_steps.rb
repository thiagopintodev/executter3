Given(/^pending$/) do
  pending # express the regexp above with the code you wish you had
end



#currently not being used
Given /^I am a visitor$/ do
  #I'm not a user, no action needed
end



Given /^I am @james$/ do
  step "James Pinto"


  visit sign_in_path
  fill_in "Email",    :with => 'james@rubyfactory.net'
  fill_in "Password", :with => 'secure!'
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


# Given /^I have one\s+user "([^\"]*)" with email "([^\"]*)" and password "([^\"]*)"$/ do |link, email, password|

#   @user = User.new :link    => link,
#                    :email       => email,
#                    :password    => password,
#                    :first_name  => "Ronald",
#                    :last_name   => "McDonald"
#   @user.save!
  
# end
