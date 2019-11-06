class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :address, :currently, :tonight, :today, :hourly, :daily
end
