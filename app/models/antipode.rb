class Antipode
  attr_reader :id, :summary

  def initialize(antipode_forecast, antipode_location, serach_city)
    @id = rand(0..999999)
    # binding.pry
    @antipode_location = antipode_location
    @summary = antipode_forecast.daily[0][:summary]
    @serach_city = search_city
  end

end
