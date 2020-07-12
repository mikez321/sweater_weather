# Sweater Weather

### Overview

Sweater weather is a Rails API hitting several namespaced REST endpoints.  It utilizes the openweather API as well as the Google Maps API.  All responses to Sweater Weather are returned as JSON and follow the JSON API spec.  The original project was forked from Turing School and can be found here:  https://backend.turing.io/module3/projects/sweater_weather/

## Endpoints

__Weather at a location:__

  ```GET api/v1/forecast```
  
  _Query Params: city,state_
  
This endpoint will expose important weather info at a desired location.  It accepts query params of a city and state which are handled though Google's Geocoding API to return Lat and Lon of the location.

Example response:
  
```
"type": "forecast",
{
    "data": {
        "id": "1",
        "type": "forecast",
        "attributes": {
            "city_name": "denver,co",
            "current": {
                "date": "07/12/2020",
                "time": 1594568266,
                "conditions": "clear sky",
                "icon": "01d",
                "current_temp": 82.94,
                "feels_like": 81.37,
                "humidity": 36,
                "visibility": "unvailable"
            },
            "daily": [
                {
                    "date": "07/12/2020",
                    "time": 1594580400,
                    "day": "Sunday",
                    ...
```

__Image of a location:__

  ```GET api/v1/backgrounds```
  
  _Query Params: city,state_

This endpoint will return an image of a place.  It uses Google's Geocoding API to provide Lat and Lon coordinates to Google Places Photos API and returns an image of a place.

__Register a new user:__

 ```POST api/v1/users```
  
  _Body (as JSON) { "email": "whatever@example.com", "password": "password", "password_confirmation": "password" }_
  
This endpoint will register a new user and add them to the PSQL database.  Passwords are encrypted with the BCrypt gem.  A successful request will return the saved user info and a unique api_key for that user.  API keys are generated using an MD5 digest combined with user info and current time down to the second the user is created.  If a new api_key needs to be generated, it will unique every second.  Unsuccessful requests are handled with useful error messages such as "Email has already been taken" and a 400 status code.
  
Example response (successful):

```
{
    "data": {
        "id": "12",
        "type": "user",
        "attributes": {
            "email": "user@example.com",
            "api_key": "d37e00fcebe91831145cf11765702d20"
        }
    }
}
```

__Register a new user:__

 ```POST api/v1/sessions```
  
  _Body (as JSON) { "email": "whatever@example.com", "password": "password" }_
  
This endpoint will log in an existing user and return their email and api_key.  Unsuccessful login attempts will return a response hinting at the cause of the error but not specific enough to give exact directions to anyone who would be trying to break into an account.

Example successful login request:
  
  ```
  {
    "data": {
        "id": "12",
        "type": "user",
        "attributes": {
            "email": "user@example.com",
            "api_key": "d37e00fcebe91831145cf11765702d20"
        }
    }
}
```

Example unsuccessful login (incorrect password entered):

```
{
    "errors": [
        {
            "status": 400,
            "source": "password",
            "detail": "user authentication failed"
        }
    ]
}
```

__Get info for a road trip:__

 ```POST api/v1/road_trip```
 
  _Body (as JSON) { "origin": "City, State", "destination": "City, State", "api_key": "d37e00fcebe91831145cf11765702d20" }_
  
This endpoint joins everything together.  If a user provides their API key and an origin and destination it will return information about their road trip.  Google APIs provide the estimated travel times, OpenWeater APIs provide weather at that location.  As above, sad paths exist and fail gracefully with JSON API spec error messages.

Sample successful request:

```
{
    "data": {
        "id": "1",
        "type": "road_trip",
        "attributes": {
            "origin": "Denver,CO",
            "destination": "Seattle, WA",
            "travel_time": "19 hours 42 mins",
            "arrival_time": 1594641393,
            "arrival_weather": {
                "temp": 49.69,
                "description": "clear sky",
                "arrival_hour": "06:00"
            }
        }
    }
}
```

## Achievements

I was excited to write clean code and follow MVC principles with skinny controllers.

I created a time calculator PORO that calcultes the arrival time in the RoadTrip endpoint.  Time is rounded up or down to the closest hour and arrival weather is represented by that hour.

I kept my (theoretical) front-end developers in mind and returned extra info they might find handy.  All weather responses include a human readable date as well as a unix time.  Things like days of the week or hours of the day were extracted out of the unix time and returned for easier data displaying and to make data easier to understand.
