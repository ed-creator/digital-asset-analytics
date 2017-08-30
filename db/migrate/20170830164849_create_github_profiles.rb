class CreateGithubProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :github_profiles do |t|
      t.string :org_name
      t.string :html_url
      t.integer :public_repos
      t.belongs_to :digital_asset, foreign_key: true

      t.timestamps
    end
  end
end
