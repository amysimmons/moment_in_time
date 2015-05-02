require 'rails_helper'

RSpec.describe InstagramMoment do

    describe '#instagrams', :vcr do
      let(:moments) { InstagramMoment.new(latitude.to_s, longitude.to_s, time) }
      let(:instagrams) { moments.instagrams }
      let(:longitude) { 151.2777 }
      let(:latitude) { -33.8910 }
      let(:time) { Date.parse('22/04/2015').to_time }

      it "contains instagrams" do
        expect(instagrams).to be_an Array
        expect(instagrams.first).to be_a Hash
      end

      it 'is around the time provided' do
        gram_time = instagrams.first["created_time"]
        expect(gram_time.to_i).to be_within(4.hours.to_i).of(time.to_i)
      end

      it 'is around the location provided' do
        expect(instagrams.first["location"]["latitude"]).to be_within(1).of(latitude)
        expect(instagrams.first["location"]["longitude"]).to be_within(1).of(longitude)
      end

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


