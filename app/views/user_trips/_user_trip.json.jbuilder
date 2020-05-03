json.extract! user_trip, :id, :total, :user_id, :trip_id, :created_at, :updated_at
json.url user_trip_url(user_trip, format: :json)
