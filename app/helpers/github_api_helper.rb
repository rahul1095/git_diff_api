module GithubApiHelper
  require 'httparty'

  BASE_URL = "https://api.github.com"

  def fetch_commit(owner, repo, commit_id)
    url = "#{BASE_URL}/repos/#{owner}/#{repo}/commits/#{commit_id}"
    response = HTTParty.get(url)
    response.parsed_response
  end

  def compare_commits(owner, repo, base_commit, head_commit)
    head_commit ||= fetch_commit(owner, repo, base_commit)["parents"].first["sha"]
    url = "#{BASE_URL}/repos/#{owner}/#{repo}/compare/#{base_commit}...#{head_commit}"
    response = HTTParty.get(url)
    response.parsed_response
  end

  def fetch_commits(owner, repo, branch = nil, since = nil, until_date = nil, per_page = 30, page = 1)
    url = "#{BASE_URL}/repos/#{owner}/#{repo}/commits"
    query = {
      sha: branch,
      since: since,
      until: until_date,
      per_page: per_page,
      page: page
    }.compact
    response = HTTParty.get(url, query: query)
    response.parsed_response
  end

  def fetch_repository(owner, repo)
    url = "#{BASE_URL}/repos/#{owner}/#{repo}"
    response = HTTParty.get(url)
    response.parsed_response
  end

  def fetch_branches(owner, repo)
    url = "#{BASE_URL}/repos/#{owner}/#{repo}/branches"
    response = HTTParty.get(url)
    response.parsed_response
  end
end
