require 'httparty'
require 'rspotify'

# A plain Ruby object that receives and models data retrieved from the Spotify API. Wraps interactions with the Spotify API by leveraging the RSpotify gem. NOTE: Data retrieved from Spotify may describe an artist, album, track, or playlist.

class Music
attr_reader :item_id, :name, :type, :image_url, :url, :uri
#where do i put in my tokens?

#PLACEHOLDER_IMG_URL = " webs"

  def initialize(data)  #data.length on data array is 20, for the keyword "banana"...i just chose [0] from the data array ...should it be an each loop here instead? Is that what they meant by the 20 favorite? :/
    @item_id = data.id
    @name = data.name #this is weird...do a raise and look at it
    @type = data.type
    @image_url =   #there are multiple url's in the image hash
      if data.type == "track" && data.album.images.present?
        data.album.images[0]["url"]
      else
        #PLACEHOLDER_IMG_URL
    @url = data.external_urls.values[0]
      end
    @uri = data.uri

  end

  def self.find(music_type,music_id)
    if music_type == "track"
      data = RSpotify::Track.find(music_id) #sometimes quotes work here, sometimes they dont....
    elsif music_type == "album"
      data = RSpotify::Album.find(music_id)
    elsif music_type == "artist"
      data = RSpotify::Artist.find(music_id)
    end
    self.new(data)

  end




  #data = RSpotify::Artist.find('1WGWUsR3u4DpQEaE8zWwcr')  #this is a specific one** make it generic based on what you get back from charles' stuff(tunestakeoutwrapper)/somehow talk to eachother
  #data = HTTParty.get("https://api.spotify.com/v1/artists/1WGWUsR3u4DpQEaE8zWwcr").parsed_response

end


#rspotify docs tell you all thing things you can call with rspotify
#RSpotify::Artist.find('1WGWUsr3U4Dp'
