Then(/^I should see the selector "(.*?)"$/) do |text|
  if page.respond_to? :should
    page.should have_selector(text)
  else
    assert page.has_selector?(text)
  end
end

Then(/^I should not see the selector "(.*?)"$/) do |text|
  if page.respond_to? :should
    page.should have_no_selector(text)
  else
    assert page.has_no_selector?(text)
  end
end



#not used
Then /^I should see the image "(.+)"$/ do |image|
    page.should have_xpath("//img[@src=\"/public/images/#{image}\"]")
end
