class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :image_urls
end
