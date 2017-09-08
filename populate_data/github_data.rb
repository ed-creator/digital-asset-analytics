require 'httparty'
require 'sqlite3'
require 'active_record'
require './app/models/application_record'
require './app/models/digital_asset'
require './app/models/github_profile'
require './app/models/github_repo'
require './app/models/github_repo_snapshot'

db_config = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(db_config['development'])

def build_github_profile(ticker, github_name)
  asset = DigitalAsset.where(ticker: ticker).first
  profile = asset.create_github_profile(org_name: github_name)
  profile.update_profile
  profile.create_repos
  profile.update_repos
  profile.update_repo_snapshots
end



build_github_profile('QTUM', 'qtumproject')
