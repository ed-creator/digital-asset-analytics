class GithubRepo < ApplicationRecord
  belongs_to :github_profile
  has_many :github_repo_snapshots
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

  def update_repo_snapshots
    response = HTTParty.get('https://api.github.com/repos/' + github_profile.org_name + '/' + name + '/stats/commit_activity')
    data = response.parsed_response
    data.each do |snapshot|
      github_repo_snapshots.create(week_beggining: snapshot['week'],
                                  total: snapshot['total'], sunday: snapshot['days'][0],
                                  monday: snapshot['days'][1],
                                  tuesday: snapshot['days'][2],
                                  wednesday: snapshot['days'][3],
                                  thursday: snapshot['days'][4],
                                  friday: snapshot['days'][5],
                                  saturday: snapshot['days'][6]
                                  )
    end
  end
end
