json.extract! itinerary, :id, :title, :name, :description, :image, :trip_id, :created_at, :updated_at
json.url itinerary_url(itinerary, format: :json)
