class InstagramMoment
  # this wraps up the IG library for our moment in time app

  def initialize
    @client = Instagram.client()
  end

  def instagrams
    query
  end

  private

  def query
    @client.media_search("37.7808851","-122.3948632")
  end

end


# client = Instagram.client()
# client.media_search("37.7808851","-122.3948632")