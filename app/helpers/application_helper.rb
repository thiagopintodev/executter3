module ApplicationHelper

  def render_sign_in_header
    return if me
    return if ['sign_in', 'password'].include?(controller_name)
    render '/sign_in/sign_in_header'
  end

  def render_flash
    %{<p id="notice">#{flash[:notice]}</p>}.html_safe if flash[:notice]
  end


  def render_top_tabs
    if me.nil?
      _page_tabs({"Forgot Password?"  => password_forgot_path,
                  "Sign In"           => sign_in_path,
                  "Sign Up"           => sign_up_path
                  })
    #elsif me.role.inquiry.admin?
    else
      _page_tabs({"Home"      => home_path,
                  me.site.u_  => site_path(me.site),
                  "Settings"  => '/',
                  "Sign Out"  => sign_out_path
                  })
    end
  end


  def _page_tabs(tabs)
    lis = tabs.map do |title, url_options|
      css_class = 'active' if current_page?(url_options)
      content_tag(:li, link_to(title, url_options), class: css_class)
    end.join
    %{<ul class="nav pull-right">#{lis}</ul>}.html_safe
  end


end
