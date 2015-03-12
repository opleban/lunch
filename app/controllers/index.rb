
get '/' do
  erb :index
end

post '/geocode_address' do
  formatted_query_params = params[:formattedAddress]
  lat_long = get_geolocation(formatted_query_params)
  if lat_long
    get_restaurants(lat_long)
  else
    status 400
    return error_message = {message: 'Please enter a valid address'}.to_json
  end
  # hit api
  # evaluate response
  # hit new api or return response
  # return response
end

