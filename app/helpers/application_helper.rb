module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to(repo, "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'nofollow noopener')
  end

  def flash_message(method)
    tag.p(flash[method], class: 'method') if flash[method]
  end

  def user_actions
    if user_signed_in?
      tag.p("Welcome, #{current_user.email} Guru") +
        link_to(' Logout', destroy_user_session_path, method: :delete, data: { confirm: 'U sure?' })
    else
      link_to('Login', new_user_session_path) + tag.p(' ') +
        link_to('Signup', new_user_registration_path)
    end
  end
end
