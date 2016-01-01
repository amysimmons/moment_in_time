class TwitterMoment

  attr_reader :lat, :long, :time

  def initialize(lat, long, time)
    @lat = lat
    @long = long
    @time = time
  end

  def raw_tweets
    #returns raw tweets if raw tweets is not nil 
    #otherwise run the query and assign that to raw tweets 
    @raw_tweets ||= query
  end

  def tweets
    # raw_tweets.select {|t| t.geo?}
    raw_tweets.attrs[:statuses].select {|t| t[:entities][:urls].count > 0 }
  end

  private

  def query
    #geocode returns tweets by users located within a given radius of 
    #the given latitude/longitude.
    $twitter
      .search("e since:#{from_date} until:#{to_date}",
              geocode: "#{lat},#{long},10km",
              lang: "en",
              count: "100"
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