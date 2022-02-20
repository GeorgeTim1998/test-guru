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
    if logged_in?
      tag.p("Welcome, #{current_user.email} Guru") +
        link_to(' Logout', logout_path, method: :delete, data: { confirm: 'U sure?' })
    else
      link_to('Login', login_path) + tag.p(' ') +
        link_to('Signup', signup_path)
    end
  end
end
