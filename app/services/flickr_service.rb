class FlickrService

  def get_photos(lat, long)
    json_response = conn.get('rest/?', {method: "flickr.photos.search",
                                        tags: "parks,nature,skyline",
                                        content_type: "1",
                                        geo_context: "2",
                                        lat: "#{lat}",
                                        lon: "#{long}",
                                        radius: "10",
                                        format: "json",
                                        nojsoncallback: "1",
                                        })
    JSON.parse(json_response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: 'https://www.flickr.com/services/',
      params: {'api_key' => ENV['FLICKR_KEY']}
    )
  end
end
