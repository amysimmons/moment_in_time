require 'httparty'
require 'oauth'
# require 'oauth/request_proxy/typhoeus_request'

class TwitterMoment

  attr_reader :lat, :long, :time

  def initialize(lat, long, bounds, time)
    @lat = lat
    @long = long
    @bounds = bounds
    @time = time
  end

  def raw_tweets
    #returns raw tweets if raw tweets is not nil 
    #otherwise run the query and assign that to raw tweets 
    @raw_tweets ||= query
  end

  def tweets
     raw_tweets.attrs[:statuses].map do |t| 
      {
        source: "twitter", 
        post_datetime: t[:created_at].in_time_zone("UTC"),
        oembed: $twitter.get("https://api.twitter.com/1.1/statuses/oembed.json?id=#{t[:id]}"),
        data: t
      }
    end
  end

  private
  def query
    #geocode returns tweets by users located within a given radius of 
    #the given latitude/longitude.
    $twitter
      .search("e since:#{from_date} until:#{to_date}",
              geocode: "#{lat},#{long},10km",
              lang: "en",
              count: 100
              )
  end

  def from_date
    (time - 1.day).to_date
  end

  def to_date
    (time + 1.day).to_date
  end

  # this wraps up the twitter library for our moment in time app
end