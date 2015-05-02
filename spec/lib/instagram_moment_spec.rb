require 'rails_helper'

RSpec.describe InstagramMoment do

    describe '#instagrams', :vcr do
      let(:moments) { InstagramMoment.new() }
      let(:instagrams) { moments.instagrams }

      it "contains instagrams" do
        expect(instagrams).to be_an Array
        expect(instagrams.first).to be_a Hash
      end

      # it 'is around the time provided' do
      #   expect(tweets.first.created_at).to be_within(2.days).of(time)
      # end

      # it 'is around the location provided' do
      #   expect(tweets.first.geo?).to eq true
      # end
    end

end

# describe "retrieving data from the api", :vcr do
#     let(:location) { double }
#     let(:time) { Date.parse('22/04/2015').to_time }
#     let(:moments) { TwitterMoment.new(location, time) }

#     it 'stores the time and location' do
#       expect(moments.location).to eq location
#       expect(moments.time).to eq time
#     end


