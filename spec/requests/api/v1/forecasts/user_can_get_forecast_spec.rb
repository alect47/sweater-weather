require 'rails_helper'

describe "Location api" do
  it "user can get forecast info for location" do
    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    forecast = JSON.parse(response.body)
    # add more testing with stubs/mocks
    # add more nested tests for these hashes
    # could also just do instance varaible for address, lat, long instead
    # initialize forecast with location and dark_sky_hash
    expect(forecast["data"]["attributes"]["address"]).to eq("Denver, CO, USA")
    expect(forecast["data"]["attributes"]["currently"]).to be_a(Hash)
    expect(forecast["data"]["attributes"]["currently"]).to have_key("icon")
    expect(forecast["data"]["attributes"]["currently"]).to have_key("temperature")
    expect(forecast["data"]["attributes"]["hourly"]).to be_a(Hash)
    expect(forecast["data"]["attributes"]["daily"][0]).to be_a(Hash)
    expect(forecast["data"]["attributes"]["today"]).to be_a(Hash)
  end
end
