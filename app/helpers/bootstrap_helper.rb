module BootstrapHelper

  def li(content, options={})
    content_tag(:li, content, options)
  end
  def text_icon(text, icon)
    %{<span>#{text}</span> #{icon(icon)}}.html_safe
  end
  def icon_text(icon, text)
    %{#{icon(icon)} <span>#{text}</span>}.html_safe
  end
  def icon_text_icon(icon, text, icon2)
    %{#{icon(icon)} <span>#{text}</span> #{icon(icon2)}}.html_safe
  end
  def link_to_icon(icon, path, options={})
    link_to icon(icon), path, options
  end
  def link_to_icon_text(icon, text, path, options={})
    link_to icon_text(icon, text), path, options
  end
  def icon(icon)
    %{<i class='icon-#{icon}'></i>}.html_safe
  end

end
