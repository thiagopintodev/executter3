module ApplicationHelper

  def render_sign_in_header
    return if me
    return if ['sign_in', 'password'].include?(controller_name)
    render '/sign_in/sign_in_header'
  end

end
