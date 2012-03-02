class HomeController < ApplicationController
  skip_filter :authenticate_user!, :only => [ :welcome ]
  
  def welcome
  end
  
  def dashboard
    @album = Album.new 
  end
end
