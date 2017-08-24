json.extract! price_history, :id, :digital_asset_id, :created_at, :updated_at
json.url price_history_url(price_history, format: :json)
