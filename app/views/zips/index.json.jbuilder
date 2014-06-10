json.array!(@zips) do |zip|
  json.extract! zip, :id, :city, :state, :state_2, :zip
  json.url zip_url(zip, format: :json)
end
