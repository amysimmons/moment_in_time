class TwitterMoment

  attr_reader :time, :location

  def initialize(location, time)
    @location = location
    @time = time
  end

  def raw_tweets
    #returns raw tweets if raw tweets is not nil 
    #otherwise run the query and assign that to raw tweets 
    @raw_tweets ||= query
  end

  def tweets
    raw_tweets.select {|t| t.geo? }
  end

  private

  def query
    $twitter
      .search("e since:#{from_date} until:#{to_date}",
              geocode: "-33.8910,151.2777,10km",
              lang: "en",
              count: 10
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