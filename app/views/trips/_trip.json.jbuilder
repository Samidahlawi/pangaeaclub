json.extract! trip, :id, :title, :sub_title, :trip_type, :country, :destination, :deadline, :level, :bg_image, :group_size_start, :group_size_end, :duration, :image, :start_date, :end_date, :description, :price, :guide_id, :region_id, :created_at, :updated_at
json.url trip_url(trip, format: :json)
