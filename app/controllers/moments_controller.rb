class MomentsController < ApplicationController
  def index
    @moments = InstagramMoment.new(lat, long, time).instagrams
  end

  private

  def location
    #if location is nil search with geocoder otherwise return the location 
    @location ||= Geocoder.search(params[:location]).first
  end

  def lat
    location.coordinates[0]
  end

  def long
    location.coordinates[1]
  end

  def time
    Time.now
  end
end

# when a request is made to the index action, the instagram moment is creates
# first it will look at the lat argument, and then go to the lat method
# the lat method calls the location method
# if there is no location, the location method requests the data from Google via geocoder
# and assigns the result to @location 
# it returns a geocoder object containing the data
# the lat method then calls .coordinates on the Geocoder object, 
# and accesses the first element to get the lat
# the new instagram moment repeats this process for long, 
# but when it hits the location method, the location is already stored, so there is no need
# for a second request to Google 
