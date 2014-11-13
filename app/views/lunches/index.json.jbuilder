json.array!(@lunches) do |lunch|
  json.extract! lunch, :id, :name, :location, :lunch_date
  json.url lunch_url(lunch, format: :json)
end
