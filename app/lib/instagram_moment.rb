class InstagramMoment
  # this wraps up the IG library for our moment in time app

  attr_reader :lat, :long, :time

  def initialize(lat, long, time)
    @client = Instagram.client()
    @lat = lat
    @long = long
    @time = time
  end

  def instagrams
    query
  end

  private

  def min_time
    time - 2.hours
  end

  def max_time
    time + 2.hours 
  end

  def query
    @client.media_search(lat, long, min_timestamp: min_time.to_i, max_timestamp: max_time.to_i)
  end

end


# client = Instagram.client()
# client.media_search("37.7808851","-122.3948632")