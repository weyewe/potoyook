class ApplicationController < ActionController::Base
  include Transloadit::Rails::ParamsDecoder
  protect_from_forgery
  before_filter :authenticate_user!
  
  
  
  def after_sign_in_path_for(resource)
    dashboard_url  
  end
  
  def after_sign_up_path_for(resource)
    dashboard_url 
  end

  
  def set_breadcrumb_for object, destination_path, opening_words
    add_breadcrumb "#{opening_words}", destination_path
  end
  
  protected
  def add_breadcrumb name, url = ''
    @breadcrumbs ||= []
    url = eval(url) if url =~ /_path|_url|@/
    @breadcrumbs << [name, url]
  end

  def self.add_breadcrumb name, url, options = {}
    before_filter options do |controller|
      controller.send(:add_breadcrumb, name, url)
    end
  end
  
  
  
end
