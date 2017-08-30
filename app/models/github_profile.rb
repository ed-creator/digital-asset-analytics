class GithubProfile < ApplicationRecord
  belongs_to :digital_asset

  def update_profile
    response = HTTParty.get('https://api.github.com/orgs/' + org_name)
    data = response.parsed_response
    self.html_url = data['html_url']
    self.public_repos = data['public_repos']
    self.save
  end
end
