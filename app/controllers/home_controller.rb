class HomeController < ApplicationController
  skip_filter :authenticate_user!, :only => [ :welcome ]
  
  def welcome
  end
  
  def dashboard
    
    @last_project  = Project.last 
    @album = current_user.album_for_project( @last_project ) 
    
    if @album.nil?
      @album = Album.new
      add_breadcrumb "Create Submission Details", dashboard_path
    else
      add_breadcrumb "Select Cover Album & Upload More Picture for: #{@album.title}", dashboard_path
    end
    
  end
end
