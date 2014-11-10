json.array!(@lunches) do |lunch|
  json.extract! lunch, :id, :name, :lunch_date, :created_at
  json.url lunch_url(lunch, format: :json)
end
