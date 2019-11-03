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

  it "can get travel tiem and distance" do
    origin = "denver,co"
    destination = "Pueblo,co"

    service = LocationService.new
    raw_data = service.get_travel(origin, destination)

    expect(service).to be_a(LocationService)
    expect(raw_data[:routes][0][:legs][0]).to be_a(Hash)
    expect(raw_data[:routes][0][:legs][0][:distance][:text]).to eq("112 mi")
    expect(raw_data[:routes][0][:legs][0][:duration][:text]).to eq("1 hour 48 mins")
    expect(raw_data[:routes][0][:legs][0][:duration][:value]).to eq(6450)
  end
end
