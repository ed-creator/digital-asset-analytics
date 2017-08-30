class CreateGithubProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :github_profiles do |t|
      t.string :link
      t.belongs_to :digital_asset, foreign_key: true

      t.timestamps
    end
  end
end
