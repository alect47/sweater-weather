require 'rails_helper'

describe "Location api" do
  xit "user can get forecast info for location" do
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO"
    }

    headers = {'CONTENT_TYPE' => 'application/json',
     'ACCEPT' => 'application/json'}

    post "/api/v1/road_trip", params: body, headers: headers

    expect(response).to be_successful
    forecast = JSON.parse(response.body)
    # add more testing with stubs/mocks
    # add more nested tests for these hashes
    # could also just do instance varaible for address, lat, long instead
    # initialize forecast with location and dark_sky_hash
    expect(forecast["data"]["attributes"]["address"]).to eq("Denver, CO, USA")
    expect(forecast["data"]["attributes"]["currently"]).to be_a(Hash)
  end
end
