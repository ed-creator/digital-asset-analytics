class GithubRepo < ApplicationRecord
  belongs_to :github_profile
  validates :github_id, uniqueness: true


  #repo name must already exist
  def update_repo
    response = HTTParty.get('https://api.github.com/repos/' + github_profile.org_name + '/' + name)
    data = response.parsed_response
    self.github_id = data['id']
    self.size = data['size']
    self.stargazers_count = data['stargazers_count']
    self.watchers_count = data['watchers_count']
    self.forks_count = data['forks_count']
    self.open_issues_count = data['open_issues_count']
    self.subscribers_count = data['subscribers_count']
    self.network_count = data['network_count']
    self.save
  end
end
