require 'rails_helper'

describe "Location api" do
  it "user can get forecast info for location" do
    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    forecast = JSON.parse(response.body)

    # add more nested tests for these hashes
    # could also just do instance varaible for address, lat, long instead
    # initialize forecast with location and dark_sky_hash
    expect(forecast["data"]["attributes"]["location"]["address"]).to eq("Denver, CO, USA")
    expect(forecast["data"]["attributes"]["location"]["latitude"]).to eq(39.7392358)
    expect(forecast["data"]["attributes"]["location"]["longitude"]).to eq(39.7392358)
    expect(forecast["data"]["attributes"]["currently"]).to eq("60.2")
    expect(forecast["data"]["attributes"]["hourly"]).to eq("some time")
    expect(forecast["data"]["attributes"]["daily"]).to eq("some time")
  end
end
