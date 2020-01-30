class Background
  attr_reader :id, :image_urls

  def initialize(flickr_hash)
    @id = rand(0..999999)
    @flickr_hash = flickr_hash
    @image_urls = []
  end

  def make_image_url
    @flickr_hash[:photos][:photo].each do |photo|
      @image_urls << "https://farm#{photo[:farm]}.staticflickr.com/#{photo[:server]}/#{photo[:id]}_#{photo[:secret]}_b.jpg"
    end
  end
end
