require 'rails_helper'

describe "Flickr api service" do
  it "can get image info by location", :vcr do
    lat = 51.6723432
    long = 0.148271

    service = FlickrService.new
    flickr_response = service.get_photos(lat, long)
    expect(service).to be_a(FlickrService)
    expect(flickr_response).to be_a(Hash)
    expect(flickr_response[:photos][:photo][0]).to have_key(:id)
    expect(flickr_response[:photos][:photo][0]).to have_key(:owner)
    expect(flickr_response[:photos][:photo][0]).to have_key(:secret)
    expect(flickr_response[:photos][:photo][0]).to have_key(:server)
    expect(flickr_response[:photos][:photo][0]).to have_key(:farm)
    expect(flickr_response[:photos][:photo][0]).to have_key(:title)
  end
end
