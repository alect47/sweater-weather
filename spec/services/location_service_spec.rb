require 'rails_helper'

describe "Location api service" do
  it "can get cities latitude and logitive" do
    address_1 = "denver,co"

    service = LocationService.new
    raw_data = service.get_geocode(address_1)
    expect(service).to be_a(LocationService)
    expect(raw_data).to be_a(Hash)
    expect(raw_data[:results][0][:geometry][:location]).to have_key(:lat)
    expect(raw_data[:results][0][:geometry][:location]).to have_key(:lng)
  end
end
