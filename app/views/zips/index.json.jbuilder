json.array!(@zips) do |zip|
  json.extract! zip, :id, :city, :state_2, :zip, :state, :lat, :long, :tz_offset, :dst
  json.url zip_url(zip, format: :json)
end
