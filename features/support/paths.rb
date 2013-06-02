# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      home_path

    when /^(.*)'s site page$/i
      site_path(Site.find_it($1))

    when /^the latest post page$/i
      post_path(Post.last)

    when /^the latest post page$/i
      post_path(Post.last)

    when /^an invalid password reset link$/i
      password_reset_path(1, 'invalid')

    when /^a valid password reset link$/i
      u = Site.find_it('@james').owner
      password_reset_path(u.id, u.generic_token)


    # when /^an invalid email confirmation link$/i
    #   confirm_email_path(1, 'invalid')
    # when /^a valid email confirmation link$/i
    #   u = Site.find_it('@james').owner
    #   confirm_email_path(u.id, u.generic_token)

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
