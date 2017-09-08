class GithubProfile < ApplicationRecord
  belongs_to :digital_asset
  has_many :github_repos
  validates :org_name, uniqueness: true


  # The GithubProfile must have the org_name to update_profile (build json containing this)
  def update_profile
    response = HTTParty.get('https://api.github.com/orgs/' + org_name)
    data = response.parsed_response
    self.html_url = data['html_url']
    self.public_repos = data['public_repos']
    self.save
  end

  # Create the set of repos for
  def create_repos
    response = HTTParty.get('https://api.github.com/orgs/' + org_name + '/repos')
    data = response.parsed_response
    data.each {|repo| github_repos.create(name: repo['name'], github_id: repo['id'])}
  end

  def update_repos
    github_repos.each do
      |repo| repo.update_repo
    end
  end

  def update_repo_snapshots
    github_repos.each do
      |repo|
      repo.update_repo_snapshots
    end
  end

  def repo_total(target)
    count = 0
    github_repos.each do |repo|
      count += repo.send(target)
    end
    return count
  end

  def watchers_count
    count = 0
    github_repos.each do |repo|
      count += repo.watchers_count
    end
    return count
  end

  def forks_count()
    count = 0
    github_repos.each do |repo|
      count += repo.forks_count
    end
    return count
  end

end
