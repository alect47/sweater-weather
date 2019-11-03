require 'rails_helper'

describe "Dark Sky api service" do
  it "can get weather for location with manual input" do
    lat = "39.7392358"
    lng = "-104.990251"

    service = DarkSkyService.new
    raw_data = service.get_forecast(lat, lng)
    expect(service).to be_a(DarkSkyService)
    expect(raw_data).to be_a(Hash)
    expect(raw_data).to have_key(:currently)
    expect(raw_data).to have_key(:hourly)
    expect(raw_data).to have_key(:daily)
  end

  it "can get weather for location with timet" do
    lat = "39.7392358"
    lng = "-104.990251"
    
    time = 1573006147

    service = DarkSkyService.new
    raw_data = service.get_forecast(lat, lng, time)

    expect(service).to be_a(DarkSkyService)
    expect(raw_data).to be_a(Hash)
    expect(raw_data).to have_key(:currently)
    expect(raw_data[:currently][:time]).to eq(time)
    expect(raw_data).to have_key(:hourly)
    expect(raw_data).to have_key(:daily)
  end
end
