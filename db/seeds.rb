Moment.destroy_all

Moment.create(:post_author => 'Joan Miro', :post_content => 'Hello world', :post_image => 'http://luisfrade.net/wp-content/uploads/2010/10/helloWorld-hold.jpg')

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