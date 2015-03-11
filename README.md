# Todo - MVP
* [X] Create landing page with address form
* [] On submission of form, hit geocode API
  - on success, backend sends back geoCodeDto, 200 status
  - on error, backend sends back error with message 'could not find address'
* [] On success of geocode ajax call, hit backend for restaurants (backend makes locu API call)
 - on success, backend formats response into restaurantDtos to send to front end
 - on error, backend sends back error with message 'sorry, experiencing tech difficulties. please try again soon'
* [] On success of locu ajax call, deserialize response into restaurant objects, insert into object collection
  - idea: have 2 collections-viewed and unviewed; on select, pop viewed restaurant from unviewed and push into viewed
  - all sampling will occur from unviewed initially
* [] Hide landing view, display new view containing randomly selected restaurant (perhaps called featuredRestaurantView)
  - featuredRestaurantView should contain one centered button underneath main panel which, on click, will select a new restaurant
