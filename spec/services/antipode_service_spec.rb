require 'rails_helper'

describe "Antipode api service" do
  it "can get antipode location" do
    lat = "22.3193039"
    lng = "114.1693611"

    service = AntipodeService.new
    raw_data = service.get_antipode(lat, lng)

    expect(service).to be_a(AntipodeService)
    expect(raw_data).to be_a(Hash)
    expect(raw_data[:data][:attributes]).to have_key(:lat)
    expect(raw_data[:data][:attributes]).to have_key(:long)
  end
end
