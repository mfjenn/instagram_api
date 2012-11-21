class HomeController < ApplicationController
  
  def index 
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end
  
  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token
    redirect_to :action => :feed if response.present?
  end

  def feed
    client = Instagram.client(:access_token => session[:access_token])
    @data = client.user_recent_media
    @data.each do |d|
      
      image = Image.find_or_create_by_url(d.images[:low_resolution].url)
      image.save!
    end  
  end
end
