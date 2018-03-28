module PortfolioosHelper
  def sample_helper
    content_tag(:h3, "My H3 tag application helper", class: "my-class")
  end

  def login_helper
     #if current user is a guest user, show register and login links
     if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: "nav-link") + " ".html_safe + (link_to "Login", new_user_session_path, class: "nav-link")
     else
      (link_to "Logout", destroy_user_session_path, method: :delete, class: "nav-link") + " ".html_safe + (link_to "Edit", edit_user_registration_path, class: "nav-link")
     end
  end

end
