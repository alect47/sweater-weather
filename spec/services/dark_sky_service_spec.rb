require 'rails_helper'

describe "Dark Sky api service" do
  it "can get weather for location with manual input" do
    lat = "39.7392358"
    lng = "-104.990251"

    service = DarkSkyService.new
    raw_data = service.get_geocode(lat, lng)
    expect(service).to be_a(DarkSkyService)
    expect(raw_data).to be_a(Hash)
    expect(raw_data).to have_key(:currently)
    expect(raw_data).to have_key(:hourly)
    expect(raw_data).to have_key(:daily)
  end
end
