class Location
  attr_reader :id, :latitude, :longitude, :address
  def initialize(location_hash)
    @id = rand(0..99999)
    @latitude = location_hash[:results][0][:geometry][:location][:lat]
    @longitude = location_hash[:results][0][:geometry][:location][:lng]
    @address = location_hash[:results][0][:formatted_address]
  end
end
