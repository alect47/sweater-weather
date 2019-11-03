class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :address, :currently, :today, :hourly, :daily
end
