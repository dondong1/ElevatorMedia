require 'rails_helper'
require 'elevator_media/Streamer'
require 'date'
require 'open_weather'
require 'rest-client'

module ElevatorMedia
  class Streamer

    def initialize
      @open_weather = ENV['open_weather_api']
    end

    # required method from week 10 Codeboxx file that renders interesting HTML content to the elevator's screens
    def getContent(type)
        getHtmlFromCloud(type)
    end

    # method that returns a specific html depending on the "type" asked in the getContent method, is 'chuck_norris' by default
    def getHtmlFromCloud(type)
     
      if type == 'weather'  
        return "<div class='elevator-media-streamer-content'>#{self.getWeather}</div>"  
      end 
  
    end

    # method that gets the weather for a specific city, Sacramento in this case
    def getWeather
      options = { units: "metric", APPID: @open_weather }
      OpenWeather::Current.city("Sacramento City, CA", options)
    end

    # method that gets the weather forecast for a selected city, in this case Sacramento city
    def getForecast
      options = { units: "metric", APPID: @open_weather }
      OpenWeather::Current.city("Sacramento City, CA", options)
    end
  end

end