class PagesController < ApplicationController
  def index
  end

  def about
  end
  
  def services
  end
  
  def products
  end
  
  def download
    send_file 'GreenCloud.png', :type=>"application/pdf", :x_sendfile=>true
  end

end
