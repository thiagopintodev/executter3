#https://gist.github.com/oem/758561

# capybara step definition for a quick and dirty date select
# For example:
# When I select "May 7, 2010" as the post "published_on" date
When /^I select "([^"]*)" as the (.+) "([^"]*)" date$/ do |date, model, selector|
  date = Date.parse(date)
  select(date.year.to_s, :from => "#{model}[#{selector}(1i)]")
  select(date.strftime("%B"), :from => "#{model}[#{selector}(2i)]")
  select(date.day.to_s, :from => "#{model}[#{selector}(3i)]")
end
