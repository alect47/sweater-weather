class Antipode
  attr_reader :id, :antipode_hash, :

  def initialize(antipode_hash, location)
    @id = rand(0..999999)
    @antipode_hash = antipode_hash
    @location = location
  end

  def make_image_url
    @flickr_hash[:photos][:photo].each do |photo|
      @image_urls << "https://farm#{photo[:farm]}.staticflickr.com/#{photo[:server]}/#{photo[:id]}_#{photo[:secret]}_b.jpg"
    end
  end
