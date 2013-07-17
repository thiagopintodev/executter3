
def array_from_sentence(sentence)
  sentence.split(/,|and/).map(&:strip)
end

Given(/^that (.+) is following (.+)$/) do |author, sentence|
  #sentence: @ned and @cerci
  author = Site.find_it author
  array_from_sentence(sentence).each do |link|
    author.follow! link
  end
end

Given(/^that (.+) has posted "(.*?)"$/) do |author, text|
  site = Site.find_it author
  site.posts.create! text: text, verb: Post::VERB_POSTED
end



When /^(?:|I )fill in the sign in header with the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    page.find("#sign_in_header").find("#user_#{name.parameterize.underscore}").set value
  end
end

When /^(?:|I )fill in the sign up box with the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    page.find("#sign_up_box").find("#user_#{name.parameterize.underscore}").set value
  end
end

When /^(?:|I )fill in the sign in box with the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    page.find("#sign_in_box").find("#user_#{name.parameterize.underscore}").set value
  end
end

