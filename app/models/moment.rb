# == Schema Information
#
# Table name: moments
#
#  id            :integer          not null, primary key
#  post_author   :string
#  post_content  :text
#  post_image    :text
#  post_url      :text
#  post_medium   :string
#  post_location :string
#  post_date     :date
#  post_time     :time
#  created_at    :datetime
#  updated_at    :datetime
#

class Moment < ActiveRecord::Base

  def fetch_facebook_posts
  end

  def fetch_twitter_posts
  end

  def fetch_instagram_posts
  end

end
