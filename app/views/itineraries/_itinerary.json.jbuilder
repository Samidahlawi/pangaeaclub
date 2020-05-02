json.extract! itinerary, :id, :title, :name, :description, :image, :created_at, :updated_at
json.url itinerary_url(itinerary, format: :json)
