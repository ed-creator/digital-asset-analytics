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

# fill in new org names
def fill_org_name
  relevant_orgs =  GithubOrgNames::GITHUB_MAP.reject {|_,v| v == 'N/A'}
  relevant_orgs.each do |k,v|
    if DigitalAsset.where(ticker: k)[0].github_profile == nil
      DigitalAsset.where(ticker: k)[0].create_github_profile(org_name: v)
    end
    puts DigitalAsset.where(ticker: k)[0].github_profile
  end
end

def buid_github_profile(asset)
  profile = asset.github_profile
  require 'pry'; binding.pry
  profile.update_profile
  profile.create_repos
  profile.update_repos
  profile.update_repo_snapshots
end


fill_org_name
DigitalAsset.first(10).each do
  |asset|
  buid_github_profile(asset)
end
# build_github_profile('QTUM', 'qtumproject')
