class MainlandingsController < ApplicationController
  def index
  end

  def control
  	if user_signed_in?
  	else
  	  redirect_to root_path
  	end
  end

end
