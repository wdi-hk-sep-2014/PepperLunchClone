json.array!(@lunches) do |lunch|
  json.extract! lunch, :id, :day, :happiness_level
  json.url lunch_url(lunch, format: :json)
end
