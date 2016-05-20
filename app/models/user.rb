require 'httparty'

#A signed-in user account, created via OmniAuth and connected to a Spotify account.


# validates :name, presence: true #string?
# validates :provider, presence: true #string and equal spotify?
# validates :uid, presence: true

class User < ActiveRecord::Base
  validates :uid, :provider, :name, presence: true

  def self.find_or_create_from_omniauth(auth_hash)
    #Find or create a user:
    @user = User.find_by(uid: auth_hash[:info][:id], provider: auth_hash[:provider])
       #will give a user if it matches those two parameters
    if !@user.nil?
      @user.name = auth_hash[:info][:display_name]
      @user.image = auth_hash[:info][:images][0][:url]
      @user.save
      return @user
    else
    #   no user found, do something here
    @user = User.new(name: auth_hash[:info][:display_name], image: auth_hash[:info][:images][0][:url],
uid: auth_hash[:info][:id], provider: auth_hash[:provider])

      if @user.save
        return @user
      else
        return nil
      end
    end
  end
end
