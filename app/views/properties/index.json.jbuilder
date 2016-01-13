json.array!(@properties) do |property|
  json.extract! property, :id, :name, :location, :prop_type, :occupancy, :details, :price, :user_id
  json.url property_url(property, format: :json)
end
