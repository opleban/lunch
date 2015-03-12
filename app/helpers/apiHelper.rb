helpers do
  def get_geolocation(formatted_query_params)
    response = HTTParty.get("http://geocoding.geo.census.gov/geocoder/locations/address?format=json&benchmark=9&#{formatted_query_params}")
    if response.code == 200
      parsed_response = JSON.parse(response.body)
      # rename keys to be more descriptive:
      x_y_hash = parsed_response['result']['addressMatches'].first['coordinates']
      lat_long_hash = {long: x_y_hash['x'], lat: x_y_hash['y']}
    else
      return nil
    end
  end

  def get_restaurants(lat_long_hash)
    options = { body:
      {
        api_key: ENV['LOCU_API_KEY'],
        fields: ['name', 'location', 'contact'],
        venue_queries: [
          {
            location: {
              geo: {
                "$in_lat_lng_radius" => [lat_long_hash[:lat], lat_long_hash[:long], 5000]
              }
            }
          }
        ]
      }.to_json
    }

    p options
    response = HTTParty.post("https://api.locu.com/v2/venue/search", options)
    p response
  end
end
