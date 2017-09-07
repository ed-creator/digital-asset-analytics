class CreateGithubRepos < ActiveRecord::Migration[5.1]
  def change
    create_table :github_repos do |t|
      t.string :name
      t.integer :size
      t.integer :stargazers_count
      t.integer :watchers_count
      t.integer :forks_count
      t.integer :open_issues_count
      t.integer :subscribers_count
      t.integer :network_count
      t.integer :github_id
      
      t.belongs_to :github_profile, foreign_key: true
      t.timestamps
    end
  end
end
