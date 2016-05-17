require 'httparty'

class Music
#BASE_URL
attr_reader :item_id, :name, :type, :image_url, :url


def initialize(data)
    @item_id = data["item_id"]
    @name = data["name"]
    @type = ["type"]
    @image_url = data["image_url"]
    @url = data["url"]
end

end
