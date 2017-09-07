class GithubRepoSnapshot < ApplicationRecord
  belongs_to :github_repo
  validates :week_beggining, uniqueness: { scope: :github_repo_id}

end
