json.array!(@add_new_users) do |add_new_user|
  json.extract! add_new_user, :id, :name, :age
  json.url add_new_user_url(add_new_user, format: :json)
end
