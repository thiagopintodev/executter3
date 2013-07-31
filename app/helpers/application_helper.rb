module ApplicationHelper

  def user_online_state(user)
    if    user.last_activity_at > 5.minutes.ago
      'online'
    elsif user.last_activity_at > 30.minutes.ago
      'afk'
    elsif user.last_activity_at > 30.days.ago
      'busy'
    end
  end

  def render_sign_in_header
    return if me
    return if ['sign_in', 'password'].include?(controller_name)
    render '/sign_in/sign_in_header'
  end

  def render_flash
    %{<p id="notice">#{flash[:notice]}</p>}.html_safe if flash[:notice]
  end


  def render_top_tabs_left
    if me.nil?
      _page_tabs 'left', "<b>Executter</b>"           => sign_up_path
    #elsif me.role.inquiry.admin?
    else
      _page_tabs 'left',  "<b>Executter</b>" => home_path,
                          me.link     => site_path(me.site),
                          me.l_       => site_mentions_path(me.site)
    end
  end

  def render_top_tabs_right
    if me.nil?
      _page_tabs 'right', "Forgot Password?"  => password_forgot_path,
                          "Sign In"           => sign_in_path,
                          "Sign Up"           => sign_up_path
    #elsif me.role.inquiry.admin?
    else
      _page_tabs 'right', "Settings"  => '/',
                          "Sign Out"  => sign_out_path
    end
  end


  def _page_tabs(position, tabs={})
    lis = tabs.map do |title, url_options|
      css_class = 'active' if current_page?(url_options)
      content_tag(:li, link_to(title.html_safe, url_options), class: css_class)
    end.join
    %{<ul class="nav pull-#{position}">#{lis}</ul>}.html_safe
  end


end
