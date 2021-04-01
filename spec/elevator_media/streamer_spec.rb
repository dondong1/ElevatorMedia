require 'rails_helper'
require 'spec_helper'
require 'elevator_media/Streamer'
require 'date'
require 'rest-client'
require 'open_weather'

describe ElevatorMedia::Streamer do

    let!(:streamer){ElevatorMedia::Streamer.new}

    # Testing if a first basic test gives back a successful response
    it "a first test to initialize environment" do
        expect(true).to be true
    end

    # Testing if the required getContent method returns "interesting content"
    it "should receive a response from getContent" do
        expect(streamer).to respond_to(:getContent)        
    end
 
   # Testing the required getContent method and what it returns
    describe "getContent behavior" do
        # Testing if the getContent method returns 'weather' type data if asked
        it "should be able to fetch weather data" do
            expect(streamer).to receive(:getWeather) {'<div>weather</div>'}
            streamer.getContent('weather')
        end
    end



    

end