require 'rails_helper'

describe "Antipode api service" do
  it "can get antipode location" do
    lat = "22.3193039"
    lng = "114.1693611"

    service = AntipodeService.new
    raw_data = service.get_antipode(lat, lng)
    binding.pry
    expect(service).to be_a(AntipodeService)
    expect(raw_data).to be_a(Hash)
    expect(raw_data).to have_key(:currently)
    expect(raw_data).to have_key(:hourly)
    expect(raw_data).to have_key(:daily)
  end
end
