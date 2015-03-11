
get '/' do
  erb :index
end

post '/geocode_address' do
  formatted_query_params = params[:formattedAddress]
  lat_long = get_geolocation(formatted_query_params)
  p lat_long
  # hit api
  # evaluate response
  # hit new api or return response
  # return response
end

