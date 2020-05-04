json.extract! booking, :id, :total, :user_id, :trip_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
