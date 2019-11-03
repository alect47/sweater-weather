class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :latitude, :longitude, :address
end
