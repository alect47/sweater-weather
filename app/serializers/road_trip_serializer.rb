class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :temperature, :summary, :travel_time
end
