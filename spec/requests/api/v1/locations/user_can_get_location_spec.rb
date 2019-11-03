require 'rails_helper'

describe "Location api" do
  it "user can send request to location api and get geocode" do
    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    location = JSON.parse(response.body)
    expect(location["lat"]).to eq("123123123")
    expect(location["lng"]).to eq("123123123")
  end
end
