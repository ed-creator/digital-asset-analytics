require 'httparty'
require 'sqlite3'
require 'active_record'
require './app/models/application_record'
require './app/models/digital_asset'
require './app/models/github_profile'
require './app/models/github_repo'
require './app/models/github_repo_snapshot'
require './data_sets/github_org_names.rb'

db_config = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(db_config['development'])

# complete redo of org names
def fill_org_name
  relevant_orgs =  GithubOrgNames::GITHUB_MAP.reject {|_,v| v == 'N/A'}
  relevant_orgs.each do |k,v|
    if DigitalAsset.where(ticker: k)[0].github_profile
      DigitalAsset.where(ticker: k)[0].github_profile.update_attribute(:org_name, v)
    else
      DigitalAsset.where(ticker: k)[0].create_github_profile(org_name: v)
    end
  end
end

def build_github_profile(ticker, github_name)
  asset = DigitalAsset.where(ticker: ticker).first
  profile = asset.create_github_profile(org_name: github_name)
  profile.update_profile
  profile.create_repos
  profile.update_repos
  profile.update_repo_snapshots
end


fill_org_name
# build_github_profile('QTUM', 'qtumproject')
