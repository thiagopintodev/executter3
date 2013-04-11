
def array_from_sentence(sentence)
  sentence.split(/,|and/).map(&:strip)
end

Given(/^that (.+) is following (.+)$/) do |author, sentence|
  #sentence: @ned and @cerci
  @author = Site.find_it author
  array_from_sentence(sentence).each do |site|
    @author.follow(site)
  end
end

Given(/^that (.+) has posted "(.*?)"$/) do |author, text|
  @site = Site.find_it author
  @site.posts.create text: text
end
