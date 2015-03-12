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
end
