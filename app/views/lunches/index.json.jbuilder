json.array!(@lunches) do |lunch|
  json.extract! lunch, :id, :lunch_date, :name, :created_at
  json.url lunch_url(lunch, format: :json)
end
