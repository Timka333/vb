class MainlandingsController < ApplicationController
  def index
  	 @landing_page = true
  end

  def control
  	if user_signed_in?
  	else
  	  redirect_to root_path
  	end
  end

end
