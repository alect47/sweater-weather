require 'rails_helper'

describe "Antipode api" do
  it "user can get forecast info for antipode city" do
    get "/api/v1/antipode?location=hongkong"

    expect(response).to be_successful

    antipode = JSON.parse(response.body)
    expect(antipode["data"]["attributes"]["location_name"]).to eq("city")
    expect(antipode["data"]["attributes"]["forecast"]["summary"]).to eq("weather")
    expect(antipode["data"]["attributes"]["forecast"]["current_temperature"]).to eq("100")
    expect(antipode["data"]["attributes"]["search_location"]).to eq("Hong Kong")
  end
end
