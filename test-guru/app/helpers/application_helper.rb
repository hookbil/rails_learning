module ApplicationHelper

  def current_year
    Time.now.year
  end

  def github_url(user, repo)
    link_to 'GitHub', "https://github.com/#{user}/#{repo}", target: :blank
  end
end
