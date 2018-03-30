module PortfolioosHelper
  def sample_helper
    content_tag(:h3, "My H3 tag application helper", class: "my-class")
  end

  def login_helper style = ''
     #if current user is a guest user, show register and login links
     if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) + " ".html_safe + (link_to "Login", new_user_session_path, class: style)
     else
      (link_to "Logout", destroy_user_session_path, method: :delete, class: style) + " ".html_safe + (link_to "Edit", edit_user_registration_path, class: style)
     end
  end

  def nav_helper style, tag_type
nav_links = <<NAV
<#{tag_type}><a href="#{tech_news_path}" class="#{style}">Tech News</a></#{tag_type}>
NAV
    nav_links.html_safe
  end

def alerts
  alert = (flash[:alert] || flash[:error] || flash[:notice])

  if alert
    alert_generator alert
  end

end

def alert_generator msg
  js add_gritter(msg, title: "Stebs Portfolio", sticky:false)
end

end
