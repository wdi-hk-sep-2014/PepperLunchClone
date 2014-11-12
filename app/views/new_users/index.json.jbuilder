json.array!(@new_users) do |new_user|
  json.extract! new_user, :id, :name, :age
  json.url new_user_url(new_user, format: :json)
end
