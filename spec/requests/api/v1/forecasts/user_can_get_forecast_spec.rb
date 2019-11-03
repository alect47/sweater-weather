require 'rails_helper'

describe "Location api" do
  it "user can send request to location with city and state and get weather" do
    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    forecast = JSON.parse(response.body)

    # add more nested tests for these hashes
    expect(forecast["location"]["address"]).to eq("denver, co")
    expect(forecast["address"]).to eq("denver, co")
    expect(forecast["currently"]).to eq("60.2")
    expect(forecast["hourly"]).to eq("some time")
    expect(forecast["daily"]).to eq("some time")
  end
end
