json.array!(@ads) do |ad|
  json.extract! ad, :id, :name, :picture
  json.url ad_url(ad, format: :json)
end
