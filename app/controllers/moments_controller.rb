class MomentsController < ApplicationController
  def index
    @instagram_moments = InstagramMoment.new(lat, long, time).instagrams if params[:location]
    @twitter_moments = TwitterMoment.new(lat, long, time).tweets if params[:location]
  end

  private

  #a helper method means this method is available for use in the view 
  helper_method :moments, :rows, :instagram_moments, :twitter_moments

  def moments
    # In the case that @moments isn't assigned, create an empty array
    # so that our view .each method doesn't blow up.
    @moments = sort_moments((@instagram_moments || Array.new) + (@twitter_moments || Array.new))
  end

  def instagram_moments
    @instagram_moments
  end

  def twitter_moments
    @twitter_moments
  end

  def sort_moments(moments)
      moments.sort_by{|m|m[:post_datetime]}
  end

  def rows
    if moments.length > 0
      @moments.each_slice(5).to_a 
    else 
      Array.new
    end 
  end

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
    Chronic.parse(params[:time])
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
