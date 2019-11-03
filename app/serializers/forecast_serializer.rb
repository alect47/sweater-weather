class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :address, :currently, :today, :tonight, :hourly, :daily
end
