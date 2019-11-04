class Antipode
  attr_reader :id, :location_name, :forecast, :search_location

  def initialize(antipode_forecast, antipode_location, search_city)
    @id = rand(0..999999)
    @location_name = antipode_location
    @forecast = {summary: antipode_forecast.daily[0][:summary],
                current_temperature: antipode_forecast.currently[:temperature].to_s
                }
    @search_location = search_city.address
  end
end
