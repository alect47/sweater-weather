require 'rails_helper'

describe "Geocoder api" do
  it "user can get coordinates", :vcr do
    get "/api/v1/coordinates?location=denver,co"

    expect(response).to be_successful

    coordinates = JSON.parse(response.body)

    expect(coordinates["data"]["attributes"]["latitude"]).to eq(39.7392358)
    expect(coordinates["data"]["attributes"]["longitude"]).to eq(-104.990251)
    expect(coordinates["data"]["attributes"]["address"]).to eq("Denver, CO, USA")
  end
end
