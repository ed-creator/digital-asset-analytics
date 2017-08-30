json.extract! github_profile, :id, :link, :digital_asset_id, :created_at, :updated_at
json.url github_profile_url(github_profile, format: :json)
