require 'rails_helper'

describe "Antipode api" do
  it "user can get forecast info for antipode city" do
    get "/api/v1/antipode?location=hongkong"

    expect(response).to be_successful

    antipode = JSON.parse(response.body)
    
    expect(antipode["data"]["attributes"]["location_name"]).to eq("M5J9+7P Cerrillos, Jujuy, Argentina")
    expect(antipode["data"]["attributes"]["forecast"]).to have_key("summary")
    expect(antipode["data"]["attributes"]["forecast"]).to have_key("current_temperature")
    expect(antipode["data"]["attributes"]["forecast"]["summary"]).to eq("Mostly cloudy throughout the day.")
    expect(antipode["data"]["attributes"]["search_location"]).to eq("Hong Kong")
  end
end
