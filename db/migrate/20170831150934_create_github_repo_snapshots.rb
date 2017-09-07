class CreateGithubRepoSnapshots < ActiveRecord::Migration[5.1]
  def change
    create_table :github_repo_snapshots do |t|
      t.string :week_beggining
      t.integer :total
      t.integer :monday
      t.integer :tuesday
      t.integer :wednesday
      t.integer :thursday
      t.integer :friday
      t.integer :saturday
      t.integer :sunday
      t.belongs_to :github_repo, foreign_key: true

      t.timestamps
    end
  end
end
