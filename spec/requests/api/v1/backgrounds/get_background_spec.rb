require 'rails_helper'

describe "Location api" do
  it "user can get forecast info for location" do
    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful

    images = JSON.parse(response.body)
    expect(images["data"]["attributes"]["image_urls"][0]).to eq("https://farm66.staticflickr.com/65535/48987958698_d029949ce8_b.jpg")
  end
end
