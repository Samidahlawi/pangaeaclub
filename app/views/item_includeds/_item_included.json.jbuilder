json.extract! item_included, :id, :title, :description, :trip_id, :created_at, :updated_at
json.url item_included_url(item_included, format: :json)
